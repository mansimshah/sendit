class TransfersController < ApplicationController

  before_action :get_transfer, only: [:download_file]

  def index
  end

  def new
    @transfer = Transfer.new
  end

  def create
    @transfer = Transfer.new(transfer_params)

    if @transfer.save
      redirect_to transfers_path
    else
      render 'new'
    end
  end

  def download_file
    data = open("#{@transfer.attachment.url}")
    send_data data.read, filename: "#{@transfer.attachment.file.filename}", disposition: 'inline', stream: 'true', buffer_size: '4096'
  end

  private

  def transfer_params
    params.require(:transfer).permit(:email_to, :email_from, :message, :attachment)
  end

  def get_transfer
    @transfer = Transfer.find(params[:id])
  end

end