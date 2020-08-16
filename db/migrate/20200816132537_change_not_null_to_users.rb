class ChangeNotNullToUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :facilities, :name, :string, null:false
  end

  def down
    change_column :facilities, :name, :string
  end
end
