class AddPriceAndOutlineToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :outline, :text
    add_column :rooms, :price, :integer
  end
end
