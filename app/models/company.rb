class Company < ApplicationRecord
  belongs_to :user
  belongs_to :subcategory, optional: true
  has_many :review
  has_many :coupon
  
  validates :name, length:{minimum: 3}, presence: true
end
