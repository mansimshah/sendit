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
    send_file @transfer.attachment.current_path, :disposition => 'attachment'
  end

  private

  def transfer_params
    params.require(:transfer).permit(:email_to, :email_from, :message, :attachment)
  end

  def get_transfer
    @transfer = Transfer.find(params[:id])
  end

end