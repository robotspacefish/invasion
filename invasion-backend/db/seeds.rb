# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.delete_all
Score.delete_all

# min = 24
# max = 40
min = 3
max = 7

# create users with a random score
5.times do
  user = User.create(username: Faker::Twitter.screen_name)
  user.scores << Score.create(value: rand(min...max))
end

# add random amount of additional scores per user
10.times do
  User.all.each do |user|
    if rand() >= 0.5
      user.scores << Score.create(value: rand(min...max))
    end
  end
end