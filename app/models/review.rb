class Review < ApplicationRecord
  belongs_to :user
  belongs_to :facility
  validates :free_weight, presence: true
  validates :machine, presence: true
  validates :caedio, presence: true
end
