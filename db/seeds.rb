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
userlist << User.create!(:email => "naustin@colgate.edu", :password => "nick666")

Gym.delete_all
Ticket.delete_all

g = Gym.create!(:name => "Trudy", :top_floor_occupancy => 0, :bottom_floor_occupancy => 0, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
#y = Gym.create!(:name => "notTrudyS", :top_floor_occupancy => 0, :bottom_floor_occupancy => 0, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
g.tickets.create!(:name => "Shelby Theisen", :floor => "top", :user => userlist[1])
g.tickets.create!(:name => "Jesse Jacob", :floor => "bottom", :user => userlist[2])
g.tickets.create!(:name => "Mickey Sacks", :floor => "top", :user => userlist[3])
#y.tickets.create!(:name => "Nick Austin", :floor => "top", :user => userlist[4])

#ticketlist2 << Ticket.create!(:name => "Nick Austin", :floor => "bottom", :user => userlist[4],:gym => y)


