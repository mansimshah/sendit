class AddDeletedAtToTransfers < ActiveRecord::Migration[5.0]
  def change
    add_column :transfers, :deleted_at, :datetime
    add_index :transfers, :deleted_at
  end
end
