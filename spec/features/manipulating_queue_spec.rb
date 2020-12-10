require 'rails_helper'
include Warden::Test::Helpers

feature "When an admin is signed in," do
    background do
        Gym.create!(:name => "Trudy", :top_floor_occupancy => 10, :bottom_floor_occupancy => 15, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
    end

    scenario "if two tickets are present, they may admit the first person to the gym and see their entry removed from the queue and the other person's position updated" do
        admin = User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
        user1 = User.create!(:email => 'stheisen@colgate.edu', :password => "shelby")
        user2 = User.create!(:email => 'jjacob@colgate.edu', :password => "jessej")
        g = Gym.find_by(name: "Trudy")
        t1 = Ticket.create!(:name => "Shelby Theisen", :floor => "top", :user => user1, :gym => g)
        t2 = Ticket.create!(:name => "Jesse Jacob", :floor => "top", :user => user2, :gym => g)
        Ticket.queueTop << t1
        Ticket.queueTop << t2
        login_as(admin, :scope => :user)
        visit(tickets_path)
        pos2before = t2.get_position_top
        expect(page).to have_content('stheisen@colgate.edu')
        expect(page).to have_content(t1.get_position_top)
        expect(page).to have_content('jjacob@colgate.edu')
        expect(page).to have_content(t2.get_position_top)
        expect(page).to have_link('Admit new gym user')
        click_link 'Admit new gym user'
        expect(page).not_to have_content('stheisen@colgate.edu')
        expect(page).to have_content("jjacob@colgate.edu")
        expect(page).to have_content(pos2before-1)
        expect(page).to have_link('Admit new gym user')
        expect(page).to have_content("Shelby Theisen was admitted to the bottom floor of the gym.")
    end
    
    scenario "once a person is admitted, the corresponding wait and occupancy values should be updated correctly" do
        admin = User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
        user1 = User.create!(:email => 'stheisen@colgate.edu', :password => "shelby")
        user2 = User.create!(:email => 'jjacob@colgate.edu', :password => "jessej")
        g = Gym.find_by(name: "Trudy")
        t1 = Ticket.create!(:name => "Shelby Theisen", :floor => "bottom", :user => user1, :gym => g)
        t2 = Ticket.create!(:name => "Jesse Jacob", :floor => "top", :user => user2, :gym => g)
        Ticket.queueBottom << t1
        Ticket.queueTop << t2
        g.add_wait_top_floor()
        g.add_wait_bottom_floor()
        visit("/")
        expect(page).to have_content("Top Queue 1 person waiting")
        expect(page).to have_content("Bottom Queue 1 person waiting")
        expect(page).to have_content("Top Floor 10 / 25")
        expect(page).to have_content("Bottom Floor 15 / 20")
        login_as(admin, :scope => :user)
        visit(tickets_path)
        click_link 'Admit new gym user'
        visit("/")
        expect(page).to have_content("Top Queue 1 person waiting")
        expect(page).to have_content("Bottom Queue 0 people waiting")
        expect(page).to have_content("Top Floor 10 / 25")
        expect(page).to have_content("Bottom Floor 16 / 20")
        visit(tickets_path)
        click_link 'Admit new gym user'
        visit("/")
        expect(page).to have_content("Top Queue 0 people waiting")
        expect(page).to have_content("Bottom Queue 0 people waiting")
        expect(page).to have_content("Top Floor 11 / 25")
        expect(page).to have_content("Bottom Floor 16 / 20")
    end
    
    scenario "if a singular ticket is present, they may admit that person to the gym, but should expect the admit button to disappear" do
        admin = User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
        user = User.create!(:email => 'stheisen@colgate.edu', :password => "shelby")
        g = Gym.find_by(name: "Trudy")
        Ticket.queueTop << Ticket.create!(:name => "Shelby Theisen", :floor => "top", :user => user, :gym => g)
        login_as(admin, :scope => :user)
        visit(tickets_path)
        expect(page).to have_content('stheisen@colgate.edu')
        click_link 'Admit new gym user'
        expect(page).not_to have_content('stheisen@colgate.edu')
        expect(page).not_to have_link('Admit new gym user')
        expect(page).to have_content("Shelby Theisen was admitted to the top floor of the gym.")
    end
    
    scenario "if tickets are not present, the admit button will not appear" do
        admin = User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
        login_as(admin, :scope => :user)
        visit(tickets_path)
        expect(page).not_to have_link('Admit new gym user')
    end
end
    