class TransfersController < ApplicationController

  before_action :get_transfer, only: [:download_file]
  before_action :get_transfer_attachment, only: [:download_file]
  after_action  :send_notification, only: [:create]

  def index
  end

  def new
    @transfer = Transfer.new
    @transfer_attachments = @transfer.transfer_attachments.build
  end

  def create
    @transfer = Transfer.new(transfer_params)

    if @transfer.save
      params[:transfer_attachments]['avatar'].each do |attachment|
        @transfer_attachments = @transfer.transfer_attachments.create!(:avatar => attachment, :transfer_id => @transfer.id)
      end
      # TransferMailer.sender_notify_email(@transfer).deliver
      # TransferMailer.receiver_notify_email(@transfer).deliver

      redirect_to transfers_path
    else
      render 'new'
    end
  end

  def download_file
    data = open("#{@transfer_attachment.avatar.url}")
    send_data data.read, filename: "#{@transfer_attachment.avatar.file.filename}", disposition: 'attachment', stream: 'true', buffer_size: '4096'

    # send_file @transfer_attachment.avatar.current_path, :disposition => 'attachment'
  end

  private

  def transfer_params
    # params.require(:transfer).permit(:email_to, :email_from, :message, :transfer_attachments_attributes => [:id, :transfer_id, :avatar])
    params.require(:transfer).permit(:email_to, :email_from, :message)
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

end