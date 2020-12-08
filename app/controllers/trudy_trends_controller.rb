require 'Date'
class TrudyTrendsController < ApplicationController
    def index
        @trudyTrends = TrudyTrend.all
        respond_to do |format|
            format.html
        end
    end
end
