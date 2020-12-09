require 'rails_helper'
include Warden::Test::Helpers

feature "When an admin is signed in," do
    
    scenario "Someone leaves the bottom floor of the gym, and the admin clicks a button to decrement the bottom floor occupancy on the admin page" do
        
        Gym.create!(:name => "Trudy", :top_floor_occupancy => 0, :bottom_floor_occupancy => 1, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
        admin = User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
        login_as(admin, :scope => :user)
        visit(tickets_path)
        click_on(class: 'minus_bottom')
        expect(page).to have_content("Current Bottom Floor Occupancy: 0")
    end
  
  scenario "Someone leaves the top floor of the gym, and the admin clicks a button to decrement the top floor occupancy on the admin page" do
        Gym.create!(:name => "Trudy", :top_floor_occupancy => 1, :bottom_floor_occupancy => 0, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
        admin = User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
        login_as(admin, :scope => :user)
        visit(tickets_path)
        click_on(class: 'minus_top')
        expect(page).to have_content("Current Top Floor Occupancy: 0")
    end
    
    scenario "Someone enters the bottom floor of the gym, and the admin clicks a button to increment the bottom floor occupancy on the admin page" do
        
        Gym.create!(:name => "Trudy", :top_floor_occupancy => 0, :bottom_floor_occupancy => 1, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
        admin = User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
        login_as(admin, :scope => :user)
        visit(tickets_path)
        click_on(class: 'plus_bottom')
        expect(page).to have_content("Current Bottom Floor Occupancy: 2")
    end
    
    scenario "Someone enters the top floor of the gym, and the admin clicks a button to increment the top floor occupancy on the admin page" do
        
        Gym.create!(:name => "Trudy", :top_floor_occupancy => 0, :bottom_floor_occupancy => 1, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
        admin = User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
        login_as(admin, :scope => :user)
        visit(tickets_path)
        click_on(class: 'plus_top')
        
        expect(page).to have_content("Current Top Floor Occupancy: 1")
    end
    
    scenario "Admin clicks a button to decrement the bottom floor occupancy on the admin page but occupancy is already 0" do
        
        Gym.create!(:name => "Trudy", :top_floor_occupancy => 0, :bottom_floor_occupancy => 0, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
        admin = User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
        login_as(admin, :scope => :user)
        visit(tickets_path)
        click_on(class: 'minus_bottom')
        expect(page).to have_content("Current Bottom Floor Occupancy: 0")
        expect(page).to have_content("Bottom Floor is Already Empty")
    end

    scenario "Admin clicks a button to decrement the top floor occupancy on the admin page but occupancy is already 0" do
        
        Gym.create!(:name => "Trudy", :top_floor_occupancy => 0, :bottom_floor_occupancy => 0, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
        admin = User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
        login_as(admin, :scope => :user)
        visit(tickets_path)
        click_on(class: 'minus_top')
        expect(page).to have_content("Current Top Floor Occupancy: 0")
        expect(page).to have_content("Top Floor is Already Empty")
    end
    
    
    scenario "Admin clicks a button to increment the top floor occupancy on the admin page but occupancy is already 25" do
        
        Gym.create!(:name => "Trudy", :top_floor_occupancy => 25, :bottom_floor_occupancy => 0, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
        admin = User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
        login_as(admin, :scope => :user)
        visit(tickets_path)
        click_on(class: 'plus_top')
        expect(page).to have_content("Current Top Floor Occupancy: 25")
        expect(page).to have_content("Top Floor is at Capacity")
        visit('/')
        expect(page).to have_content(25)
    end
    
    scenario "Admin clicks a button to increment the bottom floor occupancy on the admin page but occupancy is already 20" do
        
        Gym.create!(:name => "Trudy", :top_floor_occupancy => 25, :bottom_floor_occupancy => 20, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
        admin = User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
        login_as(admin, :scope => :user)
        visit(tickets_path)
        click_on(class: 'plus_bottom')
        expect(page).to have_content("Current Bottom Floor Occupancy: 20")
        expect(page).to have_content("Bottom Floor is at Capacity")
        visit('/')
        expect(page).to have_content(20)
    end
    
  end 