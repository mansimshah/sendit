class CreateTransfers < ActiveRecord::Migration[5.0]
  def change
    create_table :transfers do |t|
      t.string :email_to, null: false, default: ''
      t.string :email_from, null: false, default: ''
      t.string :message
      t.string :attachment
      t.timestamps
    end
  end
end
