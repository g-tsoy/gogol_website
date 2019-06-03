# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: 'admin', email: 'admin@example.com', password: 'adminadmin', password_confirmation: 'adminadmin')
Micropost.create(name: 'Test message', content: 'Hello, its test message', cover: 'https://images.unsplash.com/photo-1557785345-d6c38c93c336?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=701&q=80')
