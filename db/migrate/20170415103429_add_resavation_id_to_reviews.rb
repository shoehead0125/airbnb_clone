class AddResavationIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :resavation
  end
end
