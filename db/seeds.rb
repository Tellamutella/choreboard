# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Reward.destroy_all
Task.destroy_all
Child.destroy_all
Parent.destroy_all
parent1 = Parent.create!(email: 'parent@gmail.com', password: '123456', password_confirmation: '123456', name: 'Fisher')
child1 = Child.create!(email: 'child@gmail.com', password: '123456', password_confirmation: '123456', name: 'Jason', parent: parent1)
child2 = Child.create!(email: 'child2@gmail.com', password: '123456', password_confirmation: '123456', name: 'Ron', parent: parent1)
child3 = Child.create!(email: 'child3@gmail.com', password: '123456', password_confirmation: '123456', name: 'Ben', parent: parent1)
task1 = Task.create!(parent: parent1, child: child1, objective: "clean room", key_results: "stuff and stuff")
reward1 = Reward.create!(parent: parent1, child: child1, price: 10, name: 'test reward', details: 'old mcdonald had a farm')
parent2 = Parent.create!(email: 'p@gmail.com', password: '123456', password_confirmation: '123456', name: 'Lee')




task_list = {"Clean your room": "cloths off the floor and put away toys", "Wash dishes": "make sure u can everything in the sink", "Dusting": "dust off everything in the living room", "Sweeping": "sweep everything in the living room", 'Feeding pets': "feed bob and charlie", 'laundry': "get everything from the laundry basket"}
reward_list = {"PS4": "PS4 WITH 2 GAMES", "XBOX": "XBOX WITH GUN", "SWITCH": "SWITCH WITH MARIO GAME", "Red Dead Redemption 2": "at game stop"}
children = [child1, child2, child3]


children.each do |child|
  3.times do
    task = Task.new(
      parent: child.parent,
      child: child,
      mandatory: [true,false].sample
      )
    task.objective, task.key_results = task_list.to_a.sample
    p task.objective
    task.save
  end
  3.times do
    reward = Reward.new(
      parent: child.parent,
      price: rand(10..100),
      child: child,
      daily: [true,false].sample
      )
    reward.name, reward.details = reward_list.to_a.sample
    reward.save
  end
  child.save
end

