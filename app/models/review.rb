class Review < ApplicationRecord
  # Database relationships:
  belongs_to :company

  # Database validations:
  validates :score, presence: true
  validates :score, inclusion: { in: 1..5 }
  validates :price, presence: true
  validates :price, inclusion: { in: 1..5 }
end
