require 'rails_helper'

RSpec.describe GymsController, type: :controller do
    context "index" do
        it "routes correctly" do
            get :index
            expect(response).to have_http_status(:ok)
        end
    end
    context "show" do
        it "routes correctly" do
            get :show
            expect(response).to have_http_status(:ok)
        end

        it "renders the index template" do
            get :show
            expect(response).to render_template("show")
        end
    end
end