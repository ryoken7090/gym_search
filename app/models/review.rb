class Review < ApplicationRecord
  belongs_to :user
  belongs_to :facility
  validates :free_weight, numericality: { greater_than: 0, less_than_or_equal_to: 5}, presence: true
  validates :machine, numericality: { greater_than: 0, less_than_or_equal_to: 5}, presence: true
  validates :caedio, numericality: { greater_than: 0, less_than_or_equal_to: 5}, presence: true
end
