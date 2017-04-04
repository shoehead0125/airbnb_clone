class AddUserIdRoomIdToResavations < ActiveRecord::Migration[5.0]
  def change
    add_column :resavations, :user_id, :integer
    add_column :resavations, :room_id, :integer
  end
end
