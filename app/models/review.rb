class Review < ApplicationRecord
  belongs_to :company

  validates :score, presence: true
  validates :price, presence: true
end
