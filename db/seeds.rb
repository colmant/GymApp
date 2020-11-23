# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all

User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
User.create!(:email => 'naustin@colgate.edu', :admin => false, :password => "123456")

Ticket.delete_all
tlist = []

tlist << Ticket.create!(name: "Shelby", email: "stheisen@colgate.edu")
tlist << Ticket.create!(name: "Jesse", email: "jjacob@colgate.edu")
tlist << Ticket.create!(name: "Mickey", email: "msacks@colgate.edu")

Gym.delete_all
Gym.create!(:name => "Trudy", :top_floor_occupancy => 0, :bottom_floor_occupancy => 0, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
