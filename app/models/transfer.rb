class Transfer < ApplicationRecord

  mount_uploader :attachment, AttachmentUploader

  validates_presence_of :email_to, :email_from, :attachment
  validate :image_size_validation

  def image_size_validation
    if attachment.size > 2.gigabytes
      errors.add(:base, "Image should be less than 2GB")
    end
  end

end