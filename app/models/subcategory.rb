class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :companies

  validates :name, uniqueness: { case_sensitive: false,
    message: '. Já existe uma subcategoria registrado com o mesmo nome.' }

  validates :name, length:{minimum: 3}, presence: true
end
