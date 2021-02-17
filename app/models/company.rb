class Company < ApplicationRecord
  # Database relationships:
  belongs_to :user
  belongs_to :subcategory, optional: true
  
  has_many :review, dependent: :destroy
  has_many :coupon, dependent: :destroy
  has_many :offer, dependent: :destroy
  
  # Database validations:
  validates :name, length:{minimum: 3}, presence: true
end
