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

puts "Creating Nice Seeds......"

parent1 = Parent.create!(email: 'parent1@gmail.com', password: '123456', password_confirmation: '123456', name: 'Fisher')
parent2 = Parent.create!(email: 'parent2@gmail.com', password: '123456', password_confirmation: '123456', name: 'Lee')

child1 = Child.create!(email: 'child1@gmail.com', password: '123456', password_confirmation: '123456', name: 'Lily', parent: parent1)
child2 = Child.create!(email: 'child2@gmail.com', password: '123456', password_confirmation: '123456', name: 'Ron', parent: parent1)
child3 = Child.create!(email: 'child3@gmail.com', password: '123456', password_confirmation: '123456', name: 'Ben', parent: parent1)


optional_tasks = { "Get A average": "With A+ in math", "Learn a piano piece": "At least a level 6 piece", "Help with cooking": "help at least for 1 hour", 'laundry': "get everything from the laundry basket", "clean public area": "clean the living room/kichten/bathroom"}
mandatory_tasks = {"Clean your room": "cloths off the floor and put away toys", "Wash dishes": "make sure u can everything in the sink", "Dusting": "dust off everything in the living room", "Sweeping": "sweep everything in the living room", 'Feeding pets': "feed bob and charlie"}

big_rewards = {"PS4": "PS4 WITH 2 GAMES", "XBOX": "XBOX WITH GUN", "SWITCH": "SWITCH WITH MARIO GAME", "Red Dead Redemption 2": "at game stop", "weekend trip": "to a place of your choice" }
small_rewards = { "1hr TV": "Don't sit too close to the screen", "1hr video game": "Volume not so loud", "Museum visit": "Pick a date of your choice", "cash": "$5"}


parent1.children.each do |child|
  10.times do
    task = child.tasks.new(
      parent: child.parent,
      mandatory: [true,false].sample
      )
    if task.mandatory
      task.objective, task.key_results = mandatory_tasks.to_a.sample
    else
      task.objective, task.key_results = optional_tasks.to_a.sample
    end
    task.save
  end
  5.times do
    reward = child.rewards.new(
      parent: child.parent,
      price: rand(10..100),
      daily: [true,false].sample
      )
    if reward.daily
      reward.name, reward.details = small_rewards.to_a.sample
    else
      reward.name, reward.details = big_rewards.to_a.sample
    end
    reward.save
  end
  child.save
  p child.name
  puts "Tasks count:"
  p child.tasks.count
  puts "Rewards count:"
  p child.rewards.count
end

p "Seeds Created"
