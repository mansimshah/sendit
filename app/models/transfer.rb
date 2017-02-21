class Transfer < ApplicationRecord

  mount_uploader :attachment, AttachmentUploader

  validates_presence_of :email_to, :email_from, :attachment
  validate :image_size_validation

  after_create :notify_sender, :notify_receiver

  def image_size_validation
    if attachment.size > 2.gigabytes
      errors.add(:base, "Image should be less than 2GB")
    end
  end

  def notify_sender
    TransferMailer.sender_notify_email(self.id).deliver_now
  end

  def notify_receiver
    TransferMailer.receiver_notify_email(self.id).deliver_now
  end

end