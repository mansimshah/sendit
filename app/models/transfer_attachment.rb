class TransferAttachment < ApplicationRecord
  belongs_to :transfer
  mount_uploader :avatar, AvatarUploader
end