require 'rails_helper'

RSpec.describe TrudyTrendsController, type: :controller do
    context "index" do
        it "routes correctly" do
            get :index
            expect(response).to have_http_status(:ok)
        end
    end
    context
        it "renders the index template" do
            get :index
            expect(response).to render_template("index")
        end
    
    
    
    
end 
      
   
