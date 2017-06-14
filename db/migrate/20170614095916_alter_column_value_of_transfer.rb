class AlterColumnValueOfTransfer < ActiveRecord::Migration[5.0]
  def up
    execute "UPDATE transfers SET deleted_on = created_at + interval '7' day ;" if Transfer.exists?
    change_column :transfers, :deleted_on, :timestamp, null: false
  end

  def down
    change_column :transfers, :deleted_on, :timestamp, null: true
    execute "UPDATE transfers SET deleted_on = NULL;"
  end
end