class AddColumnsToTransfer < ActiveRecord::Migration[5.0]
  def change
    add_column :transfers, :status, :boolean, default: false
    add_column :transfers, :deleted_on, :timestamp
  end
end