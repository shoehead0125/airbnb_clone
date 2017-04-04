class AddCleaningAndServiceToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :cleaning, :integer, default: 0
    add_column :rooms, :service, :integer, default: 0
  end
end
