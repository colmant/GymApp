require 'rails_helper'
include Warden::Test::Helpers

feature "When an admin is signed in," do
    background do
        Gym.create!(:name => "Trudy", :top_floor_occupancy => 0, :bottom_floor_occupancy => 0, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
    end

    scenario "if multiple tickets are present, they may admit the first person to the gym and see their entry removed from the queue" do
        admin = User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
        user1 = User.create!(:email => 'stheisen@colgate.edu', :password => "shelby")
        user2 = User.create!(:email => 'jjacob@colgate.edu', :password => "jessej")
        Ticket.create!(:name => "Shelby Theisen", :floor => "Bottom", :user => user1)
        Ticket.create!(:name => "Jesse Jacob", :floor => "Top", :user => user2)
        login_as(admin, :scope => :user)
        visit(tickets_path)
        expect(page).to have_content('stheisen@colgate.edu')
        expect(page).to have_content('jjacob@colgate.edu')
        expect(page).to have_link('Admit new gym user')
        click_link 'Admit new gym user'
        expect(page).not_to have_content('stheisen@colgate.edu')
        expect(page).to have_content("jjacob@colgate.edu")
        expect(page).to have_link('Admit new gym user')
        expect(page).to have_content("Shelby Theisen was admitted to the gym.")
    end
    
    scenario "if a singular ticket is present, they may admit that person to the gym, but should expect the admit button to disappear" do
        admin = User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
        user = User.create!(:email => 'stheisen@colgate.edu', :password => "shelby")
        Ticket.create!(:name => "Shelby Theisen", :floor => "Bottom", :user => user)
        login_as(admin, :scope => :user)
        visit(tickets_path)
        expect(page).to have_content('stheisen@colgate.edu')
        click_link 'Admit new gym user'
        expect(page).not_to have_content('stheisen@colgate.edu')
        expect(page).not_to have_link('Admit new gym user')
        expect(page).to have_content("Shelby Theisen was admitted to the gym.")
    end
    
    scenario "if tickets are not present, the admit button will not appear" do
        admin = User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
        login_as(admin, :scope => :user)
        visit(tickets_path)
        expect(page).not_to have_link('Admit new gym user')
    end
end
    