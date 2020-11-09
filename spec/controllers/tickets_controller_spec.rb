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
        it "should redirect to index on success" do
            t = Ticket.new()
            expect(Ticket).to receive(:new) { t }
            expect(t).to receive(:save) { true }
            post :create, params: { :ticket => { :name => "dummy", :email => "jesse@colgate.edu" } }
            expect(response).to redirect_to(tickets_path)
        end
    
        it "should redirect to new on failure" do
            t = Ticket.new()
            expect(Ticket).to receive(:new).and_return(t)
            expect(t).to receive(:save).and_return(nil)
            post :create, params: { :ticket => { "name"=>"dummy", "email"=>"s@s.co" } }
            expect(response).to redirect_to(new_ticket_path)
        end
    end
  
end