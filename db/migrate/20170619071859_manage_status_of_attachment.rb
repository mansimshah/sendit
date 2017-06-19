class ManageStatusOfAttachment < ActiveRecord::Migration[5.0]
  def change
    remove_column :transfers, :status, :boolean
    add_column :transfer_attachments, :status, :boolean, default: false
  end
end
