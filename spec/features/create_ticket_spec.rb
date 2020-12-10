require 'rails_helper'
include Warden::Test::Helpers

feature "Creating a ticket" do
    background do
        Gym.create!(:name => "Trudy", :top_floor_occupancy => 0, :bottom_floor_occupancy => 0, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
    end
    
    scenario "when user is not signed in" do
        visit('/')
        click_link("Get On Queue")
        expect(page).to have_current_path(new_user_session_path)
    end

    scenario "when user is signed in and has not yet submitted a ticket" do
        user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
        login_as(user, :scope => :user)
        visit(new_ticket_path)
        fill_in 'Name', with: 'Shelby Theisen'
        select('Top', from: 'Floor')
        click_button 'Create new Ticket'
        expect(page).to have_content 'New ticket for Shelby Theisen created'
        expect(page).to have_current_path('/')
    end
    
    scenario "when user is signed in but has already submitted a ticket" do
        user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
        login_as(user, :scope => :user)
        g = Gym.find_by(name: "Trudy")
        t1 = Ticket.create!(:name => "Shelby Theisen", :floor => "Bottom", :user => user, :gym => g)
        Ticket.queueBottom << t1
        visit(new_ticket_path)
        expect(page).to have_content 'You have already submitted a ticket for the bottom floor queue.'
        expect(page).to have_content 'Your current position is: ' + t1.get_position_bottom.to_s
        expect(page).to have_current_path(new_ticket_path)
    end
    
    scenario "when user is signed in and has not yet submitted a ticket, but does not enter a name" do
        user = User.create!(:email => 'test2@example.com', :password => 'fakepw')
        login_as(user, :scope => :user)
        visit(new_ticket_path)
        click_button 'Create new Ticket'
        expect(page).to have_content 'Error creating new ticket: Name can\'t be blank, Name must include both first and last, separated by a space and properly capitalized'
        expect(page).to have_current_path(new_ticket_path)
    end
    
    scenario "when user is signed in and has not yet submitted a ticket, but enters an invalid name" do
        user = User.create!(:email => 'test3@example.com', :password => 'fakepw2')
        login_as(user, :scope => :user)
        visit(new_ticket_path)
        fill_in 'Name', with: 'joe j'
        click_button 'Create new Ticket'
        expect(page).to have_content 'Error creating new ticket: Name must include both first and last, separated by a space and properly capitalized'
        expect(page).to have_current_path(new_ticket_path)
        fill_in 'Name', with: 'joe'
        click_button 'Create new Ticket'
        expect(page).to have_content 'Error creating new ticket: Name must include both first and last, separated by a space and properly capitalized'
        expect(page).to have_current_path(new_ticket_path)
    end
    

end


