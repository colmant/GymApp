# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'faker'

200.times do
    date = DateTime.new(2020,12,1,1,1).change(day: rand(1..7), hour: rand(8..22), min: rand(0..59))
    TrudyTrend.create!(:time => date)
end


# TrudyTrend.delete_all
# trendslisit =[]

# trendslisit << TrudyTrend.create!(:day_of_week => 'Monday', :average_queue_time => '60.63', :average_queue_size => '20')
# trendslisit << TrudyTrend.create!(:day_of_week => 'Tuesday', :average_queue_time => '120.63', :average_queue_size => '32')
# trendslisit << TrudyTrend.create!(:day_of_week => 'Wednesday', :average_queue_time => '40.63', :average_queue_size => '10')
# trendslisit << TrudyTrend.create!(:day_of_week => 'Thursday', :average_queue_time => '90.63', :average_queue_size => '5')
# trendslisit << TrudyTrend.create!(:day_of_week => 'Friday', :average_queue_time => '60.63', :average_queue_size => '20')
# trendslisit << TrudyTrend.create!(:day_of_week => 'Saturday', :average_queue_time => '20.63', :average_queue_size => '0')


# User.delete_all
userlist = []
userlist << User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
userlist << User.create!(:email => "stheisen@colgate.edu", :password => "shelby")
userlist << User.create!(:email => "jjacob@colgate.edu", :password => "jessej")
userlist << User.create!(:email => "msacks@colgate.edu", :password => "mickey")
userlist << User.create!(:email => "naustin@colgate.edu", :password => "nick666")

# Gym.delete_all
# Ticket.delete_all

g = Gym.create!(:name => "Trudy", :top_floor_occupancy => 10, :bottom_floor_occupancy => 15, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
Ticket.create!(:name => "Shelby Theisen", :floor => "top", :user => userlist[1], :gym => g)
Ticket.create!(:name => "Jesse Jacob", :floor => "bottom", :user => userlist[2], :gym => g)
Ticket.create!(:name => "Mickey Sacks", :floor => "top", :user => userlist[3], :gym => g)

g.add_wait_top_floor()
g.add_wait_top_floor()
g.add_wait_bottom_floor()



