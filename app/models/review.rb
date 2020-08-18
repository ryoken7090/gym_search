class Review < ApplicationRecord
  belongs_to :user
  belongs_to :facility
  validates :free_weight, presence: true
end
