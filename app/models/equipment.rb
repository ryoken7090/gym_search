class Equipment < ApplicationRecord
  self.table_name = 'equipments'
  belongs_to :facility
end
