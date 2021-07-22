class Offer < ApplicationRecord
  # Database relationships:
  belongs_to :company
  belongs_to :tag
  has_many :review_offers, dependent: :destroy

  # Database validations:
  validates :name, length: {
    minimum: 3,
    message: ': Precisa de um nome (maior que três caracteres)'
  }
  validates :new_price, :presence => {
    :message => ': Precisa do preço da oferta'
  }
  validates :old_price, :presence => {
    :message => ': Precisa do preço antigo'
  }
  validate :check_date, on: %i[create update]

  # Model methods:
  def check_date
    if start_time.nil? || end_time.nil? || (end_time < start_time)
      errors.add(:end_time, ': Data inválida')
      return false
    end
    true
  end
end
