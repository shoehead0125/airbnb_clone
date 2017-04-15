class RenameAdressColumnToRooms < ActiveRecord::Migration[5.0]
  def change
    rename_column :rooms, :adress, :address
  end
end
