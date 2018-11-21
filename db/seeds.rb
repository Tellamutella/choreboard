# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Task.destroy_all
Child.destroy_all
Parent.destroy_all
parent1 = Parent.create!(email: 'parent@gmail.com', password: '123456', password_confirmation: '123456', name: 'Cheetos')

child1 = Child.create!(email: 'child@gmail.com', password: '123456', password_confirmation: '123456', name: 'Cheetos Jr.', parent: parent1)

task1 = Task.create!(parent: parent1, child: child1, objective: "clean room", key_results: "stuff and stuff")
