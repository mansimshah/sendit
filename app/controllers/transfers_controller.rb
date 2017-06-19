class TransfersController < ApplicationController

  before_action :get_transfer, only: [:download_file, :download_all_files]
  before_action :get_transfer_attachment, only: [:download_file]
  after_action  :send_notification, only: [:create]
  after_action  :send_download_notification, only: [:download_file]
  after_action  :send_all_download_notification, only: [:download_all_files]

  def index
  end

  def new
    @transfer = Transfer.new
    @transfer_attachments = @transfer.transfer_attachments.build
  end

  def create
    @transfer = Transfer.new(transfer_params)

    if @transfer.save
      if params[:transfer_attachments]['avatar'].present?
        params[:transfer_attachments]['avatar'].each do |attachment|
          @transfer_attachments = @transfer.transfer_attachments.create!(:avatar => attachment, :transfer_id => @transfer.id)
        end
      end
      redirect_to transfers_path
    else
      render 'new'
    end
  end

  def download_file
    data = open("#{@transfer_attachment.avatar.url}")
    send_data data.read, filename: "#{@transfer_attachment.avatar.file.filename}", disposition: 'attachment', stream: 'true', buffer_size: '4096'

    # send_file @transfer_attachment.avatar.current_path, :disposition => 'attachment'

    @transfer_attachment.update_attribute(:status,true)
  end

  def download_all_files
    @transfer.transfer_attachments.each do |attachment|
      data = open("#{attachment.avatar.url}")
      send_data data.read, filename: "#{attachment.avatar.file.filename}", disposition: 'attachment', stream: 'true', buffer_size: '4096'
      @transfer_attachment.update_attribute(:status,true)
    end

  end

  private

  def transfer_params
    params.require(:transfer).permit(:email_to, :email_from, :message, :transfer_attachments_attributes => [:id, :transfer_id, :avatar, :_destroy])
    # params.require(:transfer).permit(:email_to, :email_from, :message)
  end

  def get_transfer
    @transfer = Transfer.find(params[:id])
  end

  def get_transfer_attachment
    @transfer_attachment = TransferAttachment.find(params[:attachment])
  end

  def send_notification
    TransferMailer.sender_notify_email(@transfer).deliver_later
    TransferMailer.receiver_notify_email(@transfer).deliver_later
  end

  # Single file notification
  def send_download_notification
    TransferMailer.download_attachment_notify(@transfer,@transfer_attachment).deliver_later
  end

  # All files notification
  def send_all_download_notification
    TransferMailer.download_all_attachment_notify(@transfer,@transfer_attachment).deliver_later
  end

end