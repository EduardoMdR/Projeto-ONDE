class Role < ApplicationRecord
  # Database relationships:
  has_many :users, dependent: :nullify
end
