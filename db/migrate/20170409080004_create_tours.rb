class CreateTours < ActiveRecord::Migration[5.0]
  def change
    create_table :tours do |t|
      t.references :user, foreign_key: true, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
