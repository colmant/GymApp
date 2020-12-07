require 'Date'
class TrudyTrendsController < ApplicationController
        # Example to demonstrate the creation of a drill - down chart by fetching data from a database.
    # The `country`
    action is defined to load the base column 2D chart— the one that shows the top# 10 populous countries and has clickable data plots.
    # It fetches the country list from the * * Country * * table and then prepares the data in
    # a format compatible with FusionCharts.
    def day_trend
        # The `select`
        query is used to retrieve the name, population, and country code of the 10
        # days are sorted in order from the current day on.
        days = TrudyTrend.select(: day_of_week, : population, : code).sorted_by(Date.today.strftime("%A")).limit(7)
        gym_day_wait_time = []
        # Iterate through the list of countries in the database and create an array of hashes that
        # stores the label
        for each country data plot and its population value.
        #The hash also stores the drill - down link
        for the city chart corresponding to each country
        # data plot.
        days.each do |day |
            gym_day_wait_time.push({
                : label => country.name,
                : value => country.population,
                : link => "#{example_drilldown_path}/#{country.day_of_week}"
            })
        end
        # Create a new FusionCharts instance that initializes the chart height, width, type, container div
        # id, data source, and the data format
        @chart = Fusioncharts::Chart.new({
            : height => 400,
            : width => 600,
            : type => 'column2d',
            : renderAt => 'chart-container',
            # Chart data is passed to the `dataSource`
            parameter,
            as hashes,
            in the form of
            # key - value pairs.
            : dataSource => {
                : chart => {
                    : caption => 'Top 10 Most Populous Countries',
                    : xAxisname => 'Quarter',
                    : yAxisName => 'Amount ($)',
                    : numberPrefix => '$',
                    : theme => 'fusion',
                },
                # The data in the array of hashes is now stored in the `top_ten_populous_countries`
                # variable in the FusionCharts consumable format.
                : data => top_ten_populous_countries
            }
        })
    end
    # The `drilldown` action is defined to load the chart with the drill - down functionality.
    # It fetches the list of cities from the * * City * * table, based on the country selected in the
    # base chart.
    # It then prepares the data in a format compatible with FusionCharts.
    def drilldown
        # The `select` query is used to retrieve the name and population of the top ten cities
        # based on the country code for the selected country, in descending order.
        cities = City.select(: name, : population).where(: countrycode, params[: id]).order(population: : desc).limit(10)
        top_ten_populous_cities = []
        # Iterate through the list of cities in the database and create an array of hashes that
        # stores the label
        for each city data plot and the its population value.
        cities.each do |
        city |
        top_ten_populous_cities.push({
            : label => city.name,
            : value => city.population
        })
        end
        # Create the FusionCharts object in the controller action.
        @chart = Fusioncharts::Chart.new({
            : height => 400,
            : width => 600,
            : type => 'column2d',
            : renderAt => 'chart-container',
            : dataSource => {
                : chart => {
                    : caption => 'Top 10 Most Populous City in selected Country',
                    : xAxisname => 'Quarter',
                    : yAxisName => 'Amount ($)',
                    : numberPrefix => '$',
                    : theme => 'fusion',
                },
                : data => top_ten_populous_cities
            }
        })
    end
end
