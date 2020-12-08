class ChartsController < ApplicationController
    def trends_by_day
        result = TrudyTrend.group(:average_queue_size).count
        render json: [{name: 'Count', data: result}]
    end
end
