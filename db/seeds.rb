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

  User.create(
    name: 'admin',
    role: adm_role,
    email: 'admin@admin.com.br',
    password: '123456'
  )
  User.create(
    name: 'empresa',
    role: company_role,
    email: 'empresa@empresa.com.br',
    password: '123456'
  )
  User.create(
    name: 'usuario',
    role: user_role,
    email: 'usuario@usuario.com.br',
    password: '123456'
  )
end