class AddCityRefToFacilities < ActiveRecord::Migration[5.2]
  def change
    add_reference :facilities, :city, foreign_key: true
  end
end
