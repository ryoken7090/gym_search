class DropTableEquipments < ActiveRecord::Migration[5.2]
  def change
    drop_table :equipment do |t|
      t.string :name

      t.timestamps
    end
  end
end
