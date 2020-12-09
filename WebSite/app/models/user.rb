class User < ApplicationRecord
  authenticates_with_sorcery!

  # Database relationships:
  belongs_to :role
end
