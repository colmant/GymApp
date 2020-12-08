require 'rails_helper'
include Warden::Test::Helpers

feature "When an admin is signed in," do
    background do
        Gym.create!(:name => "Trudy", :top_floor_occupancy => 0, :bottom_floor_occupancy => 0, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
    end
    
    scenario "Someone leaves the bottom floor of the gym, and the admin clicks a button to decrement the bottom floor capacity on the home page" do
        
        admin = User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
        login_as(admin, :scope => :user)
        visit(tickets_path)
        click_link 'Decrement Bottom Floor Capacity'
        expect(g.bottom_floor_occupancy).to eq(0)
        visit('/')
        expect(page).to have_content(0)
    end
  
  scenario "Someone leaves the top floor of the gym, and the admin clicks a button to decrement the top floor capacity on the home page" do
        
        admin = User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
        login_as(admin, :scope => :user)
        visit(tickets_path)
        click_link ('Decrement Top Floor Capacity')
        expect(g.top_floor_occupancy).to eq(0)
        visit('/')
        expect(page).to have_content(0)
    end
  end 