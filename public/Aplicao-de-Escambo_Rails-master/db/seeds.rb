# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Cadastrando as CATEGORIAS..."

categories = [ "Animais e Acessórios",
              "Esportes",
              "Para sua casa",
              "Eletrônicos e Celulares",
              "Música e hobbies",
              "Bebês e crianças",
              "Moda e Beleza",
              "Veículos e barcos",
              "Imóveis",
              "Empregos e negócios" ]

categories.each do |category|
  Category.friendly.find_or_create_by(description:category)
end

puts "Categorias cadastradas com sucesso!"



######################

puts "Cadastrando administrador padrão..."

Admin.create(
  name: "Admin",
  email: "admin@admin.com", 
  password: "123456", 
  password_confirmation: "123456",
  role: 0
  )

puts "Administrador cadastrado com sucesso!"


######################


puts "Cadastrando MEMBRO padrão..."

Member.create(
  email: "member@member.com", 
  password: "123456", 
  password_confirmation: "123456",
  )

puts "Membro cadastrado com sucesso!"