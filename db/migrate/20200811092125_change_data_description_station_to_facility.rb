class ChangeDataDescriptionStationToFacility < ActiveRecord::Migration[5.2]
  def up
    change_column :facilities, :description_station, :string
  end
  def down
    change_column :facilities, :description_station, 'integer USING CAST(description_station AS integer)'
  end
end
