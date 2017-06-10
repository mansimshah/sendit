class RemoveColumnFromTransfer < ActiveRecord::Migration[5.0]
  def change
    remove_column :transfers, :attachment
  end
end
