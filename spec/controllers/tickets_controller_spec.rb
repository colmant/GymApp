require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
    context "index" do
        it "routes correctly" do
            get :index
            expect(response).to have_http_status(:ok)
        end

        it "renders the index template" do
            get :index
            expect(response).to render_template("index")
        end
    end
    
    context "new" do
        it "routes correctly" do
            get :new
            expect(response).to have_http_status(:ok)
        end
        
        it "renders the new template" do
            get :new
            expect(response).to render_template("new")
        end
    end
  
    context "create new ticket" do
        it "should redirect to homepage on success" do
            g = Gym.create!(:name => "Trudy", :top_floor_occupancy => 10, :bottom_floor_occupancy => 15, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
            t = Ticket.new()
            expect(Ticket).to receive(:new) { t }
            expect(t).to receive(:save) { true }
            post :create, params: { :ticket => { :name => "John Deer", :floor => "top", :gym => g } }
            expect(response).to redirect_to("/")
        end
    
        it "should redirect to new on failure" do
            g = Gym.create!(:name => "Trudy", :top_floor_occupancy => 10, :bottom_floor_occupancy => 15, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
            t = Ticket.new()
            expect(Ticket).to receive(:new).and_return(t)
            expect(t).to receive(:save).and_return(nil)
            post :create, params: { :ticket => { :name => "Jane Doe", :floor => "bottom", :gym => g } }
            expect(response).to redirect_to(new_ticket_path)
        end
    end
    
    context "destroy" do
        it "deletes the ticket" do
            g = Gym.create!(:name => "Trudy", :top_floor_occupancy => 10, :bottom_floor_occupancy => 15, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
            @user = User.create!(:email => "sth@colgate.edu", :password => "123456")
            @ticket = Ticket.create!(:name => "Shelby Theisen", :user => @user, :gym => g)
            expect{
              delete :destroy, params: { id: @ticket.id }     
            }.to change(Ticket,:count).by(-1)
        end
        
        it "renders the index template on success" do
            g = Gym.create!(:name => "Trudy", :top_floor_occupancy => 10, :bottom_floor_occupancy => 15, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
            @user = User.create!(:email => "sth@colgate.edu", :password => "123456")
            @ticket = Ticket.create!(:name => "Shelby Theisen", :user => @user, :gym => g)
            delete :destroy, params: { id: @ticket.id }
            expect(response).to redirect_to(tickets_path)
        end
    end
end