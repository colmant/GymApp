class ChartsController < ApplicationController
    def trends_by_day
        render json: TrudyTrend.select(:day_of_week, :average_queue_size)
    end
end
