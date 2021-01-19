class Coupon < ApplicationRecord
  belongs_to :company

  validates :name, length:{minimum: 3}, presence: true
  validates :value, presence: true
  validates :end_time, presence: true

  def check_date
    if start_time.nil? || end_time.nil? || (end_time < start_time)
      errors.add(:end_time, 'inválida')
      return false
    end
    true
  end
end
