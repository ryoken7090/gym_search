class Tagging < ApplicationRecord
  belongs_to :facility
  belongs_to :tag
end
