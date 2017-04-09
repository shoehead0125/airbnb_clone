class AddStatusReviewToResavation < ActiveRecord::Migration[5.0]
  def change
    add_column :resavations, :status_review, :integer, default: 0, limit: 1
  end
end
