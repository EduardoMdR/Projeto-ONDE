# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

already_seeded = Role.count.positive?

unless already_seeded
  # Criação das roles
  adm_role = Role.create!(name: 'Administrador')
  company_role = Role.create!(name: 'Empresa')
  user_role = Role.create!(name: 'Usuário')

  # Criação de usuários
  # User.create(
  #   email: 'sergio@enotecadecanterbsb.com.br',
  #   password: '123456',
  #   name: 'Sérgio Inoue',
  #   cpf: '904.742.470-07',
  #   phone_number: '(61) 99820-8800'
  #   role: adm_role
  # )
end
