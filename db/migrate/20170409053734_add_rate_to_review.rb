class AddRateToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :rate, :integer, null: false
  end
end
