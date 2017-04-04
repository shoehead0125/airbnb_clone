class ChangeColumnOnResavations < ActiveRecord::Migration[5.0]
  def change
      change_column :resavations, :start_day, :date
      change_column :resavations, :end_day, :date
  end
end
