class Subcategory < ApplicationRecord
  # Database relationships:
  belongs_to :category
  has_many :companies

  # Database validations:
  validates :name, uniqueness: { 
    case_sensitive: false,
    message: '. Já existe uma subcategoria registrado com o mesmo nome.' 
  }
  validates :name, length:{minimum: 3}, presence: true
end
