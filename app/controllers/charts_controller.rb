class ChartsController < ApplicationController
    def trends_by_day
        render json: TrudyTrend.group_by_day(:average_queue_size).count
    end
end
