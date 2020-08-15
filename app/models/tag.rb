class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :taggings, dependent: :destroy
  has_many :facilities, through: :taggings, source: :facility
end
