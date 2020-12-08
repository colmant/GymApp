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
    # context "update" do
    #     it "decrements the top floor occupancy by 1" do
    #         @gym = Gym.new(:name => "Trudy", :top_floor_occupancy => 10, :bottom_floor_occupancy => 15, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 2, :wait_bottom_floor => 0)
    #         expect{
    #           patch :update, params[gym_path(:id => 1)]     
    #         }.to change(@gym,:top_floor_occupancy).by(-1)
    #     end
    #     it "decrements the botom floor occupancy by 1" do
    #         @gym = Gym.new(:name => "Trudy", :top_floor_occupancy => 10, :bottom_floor_occupancy => 15, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 2, :wait_bottom_floor => 0)
    #         expect{
    #           patch :update, params[gym_path(:id => 1)]     
    #         }.to change(@gym,:bottom_floor_occupancy).by(-1)
    #     end
    # end
    
end