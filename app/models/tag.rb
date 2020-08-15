class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :taggings, dependent: :destroy
  has_many :tagging_facilities, through: :taggings, source: :facility
end
