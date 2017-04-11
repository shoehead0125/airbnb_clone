class AddTourIdToResavation < ActiveRecord::Migration[5.0]
  def change
    add_column :resavations, :tour_id, :integer, default: 0
  end
end
