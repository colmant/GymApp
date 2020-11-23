class GymsController < ApplicationController
    
    def index
    end
    
    def show
        @gym = Gym.find_by(name: "Trudy")
    end
    
end