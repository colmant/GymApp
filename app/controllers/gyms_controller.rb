class GymsController < ApplicationController
    
    def index
    end
    
    def show
        @gym = Gym.find_by(name: "Trudy")
    end
    
    def update
    
        flash[:notice] = "#{params[:submit]}"
        
        puts params.inspect
        puts "Hello world"
        puts params[:id]
        @gym = Gym.find_by(name: "Trudy")
        if params[:id] == "1"
            @gym.subtract_top_floor()
        else 
            @gym.subtract_bottom_floor()
        end
    end
    

end