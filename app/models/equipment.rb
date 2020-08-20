class Equipment < ApplicationRecord
  has_many :facility_equipments, dependent: :destroy
  has_many :facilities, through: :facility_equipments, source: :facility
end
