class Breed < ApplicationRecord
  has_many :breed_images, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :temperament, presence: true
end
