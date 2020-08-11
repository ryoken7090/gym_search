class RenameRecordColumnToFacilities < ActiveRecord::Migration[5.2]
  def change
    rename_column :facilities, :record, :recordable
  end
end
