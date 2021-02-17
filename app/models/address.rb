class Address < ApplicationRecord
  belongs_to :user

  validates :recipient_name, :address_line, :cep,
            :city, :number, :phone_number, :state,
            :user_id, presence: true

  validates :cep, length: { is: 9, message: 'Formato inválido' }
end
