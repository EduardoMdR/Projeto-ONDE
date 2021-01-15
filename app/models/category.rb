class Category < ApplicationRecord
  validates :name, length:{minimum: 3}, presence: true
end
