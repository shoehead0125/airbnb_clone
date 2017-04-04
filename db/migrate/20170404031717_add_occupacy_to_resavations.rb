class AddOccupacyToResavations < ActiveRecord::Migration[5.0]
  def change
    add_column :resavations, :occupancy, :integer
  end
end
