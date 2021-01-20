class ReviewOffer < ApplicationRecord
  # Database relationships:
  belongs_to :offer
  belongs_to :user

  # Database validations:
  validates :score, presence: true
  validates :score, inclusion: { in: 1..5 }
end
