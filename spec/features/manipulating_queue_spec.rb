require 'rails_helper'
include Warden::Test::Helpers

feature "When an admin is signed in" do
    background do
        Gym.create!(:name => "Trudy", :top_floor_occupancy => 0, :bottom_floor_occupancy => 0, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
    end

    scenario "if a ticket is present, they may admit to gym and remove from table of tickets" do
        user = User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
        Ticket.create!(:name => "Shelby Theisen", :floor => "Bottom", :user => user)
        login_as(user, :scope => :user)
        visit(tickets_path)
        expect(page).to have_content 'Bottom'
        click_link 'Admit new gym user'
        expect(page).not_to have_content 'Bottom'
        expect(page).not_to have_link('Admit new gym user')
        expect(page).to have_content("Shelby Theisen was admitted to the gym.")
    end
end
    