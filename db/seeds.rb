# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
userlist = []
userlist << User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
userlist << User.create!(:email => "stheisen@colgate.edu", :password => "shelby")
userlist << User.create!(:email => "jjacob@colgate.edu", :password => "jessej")
userlist << User.create!(:email => "msacks@colgate.edu", :password => "mickey")


Ticket.delete_all
ticketlist = []
ticketlist << Ticket.create!(:name => "Shelby Theisen", :floor => "top", :user => userlist[1])
ticketlist << Ticket.create!(:name => "Jesse Jacob", :floor => "bottom", :user => userlist[2])
ticketlist << Ticket.create!(:name => "Mickey Sacks", :floor => "top", :user => userlist[3])


Gym.delete_all
Gym.create!(:name => "Trudy", :top_floor_occupancy => 0, :bottom_floor_occupancy => 0, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)


