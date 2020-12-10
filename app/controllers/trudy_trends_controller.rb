
class TrudyTrendsController < ApplicationController
    def index

        @trudy_trends = TrudyTrend.all()

        @trudyTrends = TrudyTrend.all
        respond_to do |format|
            format.html
        end

    end
end
