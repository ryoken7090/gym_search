class RecreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipments do |t|
      t.integer :name, null: false
      t.integer :amount, null: false, default: -1
      t.references :facility, foreign_key: true
      t.timestamps
    end
  end
end
