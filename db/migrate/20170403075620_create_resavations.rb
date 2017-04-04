class CreateResavations < ActiveRecord::Migration[5.0]
  def change
    create_table :resavations do |t|
      t.integer :start_day, null: false
      t.integer :end_day, null: false
      t.integer :price, null: false
      t.integer :status, default: 0, null: false, limit: 1
      t.timestamps
    end
  end
end
