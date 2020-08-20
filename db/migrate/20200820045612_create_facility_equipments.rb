class CreateFacilityEquipments < ActiveRecord::Migration[5.2]
  def change
    create_table :facility_equipments do |t|
      t.integer :equipment_id
      t.integer :facility_id
      t.integer :number
      t.timestamps
    end
  end
end
