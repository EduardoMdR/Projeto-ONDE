class User < ApplicationRecord
  authenticates_with_sorcery!

  # Database relationships:
  belongs_to :role

  # Model methods:
  def admin?
    role == Role.find_by(name: 'Admin')
  end

  def company?
    role == Role.find_by(name: 'Empresa')
  end
end
