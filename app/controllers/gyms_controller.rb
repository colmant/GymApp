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
        else 
            @gym.subtract_bottom_floor()
        end
    end
    

end