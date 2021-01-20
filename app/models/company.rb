class Company < ApplicationRecord
  # Database relationships:
  belongs_to :user
  belongs_to :subcategory, optional: true
  has_many :review
  has_many :coupon
  
  # Database validations:
  validates :name, length:{minimum: 3}, presence: true
end
