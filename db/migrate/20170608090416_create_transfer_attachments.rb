class CreateTransferAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :transfer_attachments do |t|
      t.integer :transfer_id, foreign_key: true
      t.string :avatar
      t.timestamps
    end
  end
end
