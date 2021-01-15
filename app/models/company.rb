class Company < ApplicationRecord
  belongs_to :user, optional: true
  validates :name, length:{minimum: 3}, presence: true
end
