class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.string :name
      t.integer :drop
      t.integer :parking
      t.integer :shower
      t.integer :record
      t.integer :visiter
      t.integer :monthly_fee
      t.integer :accessible_ten_min
      t.integer :trainer
      t.integer :open_all_time
      t.string :station
      t.integer :description_station
      t.string :address
      t.string :tell
      t.string :hp_url
      t.string :regular_holiday
      t.string :business_hours
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
