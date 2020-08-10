class ChangeNotnullToFacilities < ActiveRecord::Migration[5.2]
  def up
    change_column :facilities, :name, :string, null:false
    add_index :facilities, :name, unique: true
  end

  def down
    change_column :facilities, :name, :string
    remove_index :facilities, :name
  end
end
