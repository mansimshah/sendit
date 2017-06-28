class TransferAttachment < ApplicationRecord
  acts_as_paranoid

  belongs_to :transfer
  mount_uploader :avatar, AvatarUploader
end