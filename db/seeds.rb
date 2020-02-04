# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

BarberShop.create(name: "So Sharp Barber Shop") 
Barber.create(name: 'master barber', email: 'fake@gmail.com', barber_shop_id: 1) 
Barber.create(name: 'salon guyforeal', email: 'fufu@hair.commm', barber_shop_id: 1) 
Barber.create(name: 'rick legit', email: 'yo@gmail.com', barber_shop_id: 1) 
Customer.create(name: "Morty", email: "notfake@gmail.com", phone_number: 3333333333, password: "1234", password_confirmation: "1234") 
Customer.create(name: "Long Hair", email: "noreallyreal@gmail.com", phone_number: 444444444, password: "4321", password_confirmation: "4321")