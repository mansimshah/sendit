class Transfer < ApplicationRecord

  has_many :transfer_attachments

  accepts_nested_attributes_for :transfer_attachments

  validates_presence_of :email_to, :email_from

  # after_save :notify_sender, :notify_receiver

  after_create :set_deleted_on

  # validate :image_size_validation
  #
  # def image_size_validation
  #   if attachment.size > 2.gigabytes
  #     errors.add(:base, "Image should be less than 2GB")
  #   end
  # end

  # def notify_sender
  #   TransferMailer.sender_notify_email(self.id).deliver_later
  # end
  #
  # def notify_receiver
  #   TransferMailer.receiver_notify_email(self.id).deliver_later
  # end

  def set_deleted_on
    self.update_attribute(:deleted_on,created_at + 7.days)
  end

end