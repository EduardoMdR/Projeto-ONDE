class User < ApplicationRecord
  authenticates_with_sorcery!

  # Database relationships:
  belongs_to :role
  has_one_attached :photo
  has_one :company
  has_many :addresses, dependent: :delete_all

  # Model methods:
  def admin?
    role == Role.find_by(name: 'Admin')
  end

  def company?
    role == Role.find_by(name: 'Empresa')
  end
end
