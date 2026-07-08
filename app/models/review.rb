
class Review < ApplicationRecord
  belongs_to :breed

  validates :reviewer_name, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, in: 1..5 }
  validates :comment, presence: true
end
