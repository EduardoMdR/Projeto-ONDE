class Tag < ApplicationRecord
  # Database relationships:
  has_many :offers, dependent: :destroy

  # Database validations:
  validates :name, :presence => {
    :message => ': Precisa de um nome'
  }
end
