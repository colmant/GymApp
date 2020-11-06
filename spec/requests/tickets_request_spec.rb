require 'rails_helper'

RSpec.describe "Tickets", type: :request do
    
  it "should correctly route for the index view" do
    get tickets_path
    expect(response).to have_http_status(:ok)
  end

  it "should correctly route for the new view" do
    get new_ticket_path
    expect(response).to have_http_status(:ok)
  end
  
  
  describe "create new product" do
    it "should redirect to index on success" do
        t = Ticket.new
        expect(Ticket).to receive(:new) { t }
        expect(t).to receive(:save) { true }
        post :create, :params => { :ticket => { :name => "dummy", :email => "jesse@colgate.edu" } }
        expect(response).to redirect_to(tickets_path)
    end
    
    
    
    it "should redirect to new on failure" do
        t = Ticket.new
        expect(Ticket).to receive(:new).and_return(t)
        expect(t).to receive(:save).and_return(nil)
        post tickets_path, { :ticket => { "name"=>"dummy", "email"=>"s@s.co" } }
        expect(response).to redirect_to(new_ticket_path)
    end
  end
    

  

end
