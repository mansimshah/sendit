class AlterColumnValueOfTransfer < ActiveRecord::Migration[5.0]
  def up
    execute "UPDATE transfers SET deleted_on = created_at + interval '7' day ;" if Transfer.exists?
  end

  def down
    execute "UPDATE transfers SET deleted_on = NULL;"
  end
end