
class TrudyTrendsController < ApplicationController
    def index

        @trudy_trends = TrudyTrend.all()

        @trudyTrends = TrudyTrend.all
        respond_to do |format|
            format.html
        end

    end
    def show
        @gym = Gym.find_by(name: "Trudy")
    end
    
    def new
        @time = DateTime.new()
        #@gym = Gym.find_by(name: "Trudy")
        return @time
    end
    
    def create
        @time = DateTime.new(time_params)
        #@time.gym = Gym.find_by(name: "Trudy")
        return @time
    end
    
    def time_params
        params.require(:time).permit(:DateTime)
    end
    
end
