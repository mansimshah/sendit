class TransferMailer < ApplicationMailer
  default from: 'support@sendit.com'

  def sender_notify_email(transfer)
    return false unless load_transfer(transfer).present?
    mail to: @transfer.email_from, subject: 'Thanks for using SendIt'
  end

  def receiver_notify_email(transfer)
    return false unless load_transfer(transfer).present?
    mail to: @transfer.email_to, subject: "#{@transfer.email_from} " + 'has sent you a file via SendIt'
  end

  def download_attachment_notify(transfer)
    return false unless load_transfer(transfer).present?
    mail to: @transfer.email_from, subject: "#{@transfer.email_to}" + 'downloaded your SendIt files'
  end

  protected

  def load_transfer(transfer)
    @transfer =  Transfer.find(transfer.id)
  end

end