class Category < ApplicationRecord
  has_many :subcategories, dependent: :destroy

  validates :name, uniqueness: { case_sensitive: false,
    message: '. Já existe uma categoria registrado com o mesmo nome.' }

  validates :name, length:{minimum: 3}, presence: true
end
