feature "Visiting the home page" do
    background do
        Gym.create!(:name => "Trudy", :top_floor_occupancy => 0, :bottom_floor_occupancy => 0, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
    end
    
    scenario "when a user is signed in and has submitted a ticket" do
        user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
        login_as(user, :scope => :user)
        g = Gym.find_by(name: "Trudy")
        t1 = Ticket.create!(:name => "Shelby Theisen", :floor => "Bottom", :user => user, :gym => g)
        visit('/')
        expect(page).to have_content "Shelby Theisen's position in queue for bottom floor:" + t1.get_position_bottom.to_s
    end
    
    scenario "when a user is not signed in" do
        visit('/')
        expect(page).not_to have_content 'Position in Queue: '
    end
    
    scenario "when a user is signed in but has not submitted a ticket" do
        user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
        login_as(user, :scope => :user)
        visit('/')
        expect(page).not_to have_content 'Position in Queue: '
    end
    
     scenario "when an admin is signed" do
        user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd', :admin => true)
        login_as(user, :scope => :user)
        visit('/')
        expect(page).not_to have_content 'Position in Queue: '
    end
    
    
    
    
    
    
end