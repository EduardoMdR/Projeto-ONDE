class Company < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :subcategory
  
  validates :name, length:{minimum: 3}, presence: true
end
