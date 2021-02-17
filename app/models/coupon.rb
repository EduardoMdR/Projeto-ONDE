class Coupon < ApplicationRecord
  # Database relationships:
  belongs_to :company

  # Database validations:
  validates :name, length: {
    minimum: 3,
    message: ': Precisa de um nome (maior que três caracteres)'
  }
  validates :value, :presence => {
    :message => ': Precisa de um valor de desconto'
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
