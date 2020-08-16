class AddPosterRefToFacilities < ActiveRecord::Migration[5.2]
  def change
    add_reference :facilities, :poster, foreign_key: { to_table: :users }, null: false
  end
end
