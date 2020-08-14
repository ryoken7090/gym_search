class ChangeDefaultZero < ActiveRecord::Migration[5.2]
  def up
    change_column :facilities, :drop, :integer, default: 0
    change_column :facilities, :parking, :integer, default: 0
    change_column :facilities, :shower, :integer, default: 0
    change_column :facilities, :record, :integer, default: 0
    change_column :facilities, :visiter, :integer, default: 0
    change_column :facilities, :accessible_ten_min, :integer, default: 0
    change_column :facilities, :trainer, :integer, default: 0
    change_column :facilities, :open_all_time, :integer, default: 0
  end

  def down
    change_column :facilities, :drop, :integer
    change_column :facilities, :parking, :integer
    change_column :facilities, :shower, :integer
    change_column :facilities, :record, :integer
    change_column :facilities, :visiter, :integer
    change_column :facilities, :accessible_ten_min, :integer
    change_column :facilities, :trainer, :integer
    change_column :facilities, :open_all_time, :integer
  end
end
