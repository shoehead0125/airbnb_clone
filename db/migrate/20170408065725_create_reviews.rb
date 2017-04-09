class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text  :body, null: false
      t.references :user, foreign_key: true, null: false
      t.references :room, foreign_key: true, null: false
      t.timestamps
    end
  end
end
