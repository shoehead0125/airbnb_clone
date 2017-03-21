class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :category, null: false, limit: 1
      t.integer :max_number, null: false, limit: 1
      t.string  :adress, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
