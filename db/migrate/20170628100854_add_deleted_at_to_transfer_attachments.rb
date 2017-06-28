class AddDeletedAtToTransferAttachments < ActiveRecord::Migration[5.0]
  def change
    add_column :transfer_attachments, :deleted_at, :datetime
    add_index :transfer_attachments, :deleted_at
  end
end
