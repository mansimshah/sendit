class Transfer < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
end
