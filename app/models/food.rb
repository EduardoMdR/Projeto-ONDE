class Food < ApplicationRecord
  # Database relationships:
  belongs_to :company
  # has_many :side_sidh
  # has_one_attached :photo

  # Database validations:
  validates :name, length: {
    minimum: 3,
    message: ': Precisa de um nome (maior que três caracteres)'
  }
  validates :price, :presence => {
    :message => ': Precisa do preço da oferta'
  }
end
