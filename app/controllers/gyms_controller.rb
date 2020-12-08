class GymsController < ApplicationController
    
    def index
    end
    
    def show
        @gym = Gym.find_by(name: "Trudy")
    end
    
    def update
        @gym = Gym.find_by(name: "Trudy")
        if params[:id] == "1"
            @gym.subtract_top_floor()
        elsif params[:id] == "2"
            @gym.subtract_bottom_floor()
        elsif params[:id] == "3"
            @gym.add_top_floor()
        else 
            @gym.add_bottom_floor()
        end
        redirect_to tickets_path and return
    end
    

end