module TrudyTrendsHelper
    def trends_by_days
        bar_chart trends_by_day_charts_path height: '500px', library: {
            title: {text: 'Busiest Gym Days', x: -20},
            yAxis: {
                allowDecimals: false,
                title: {
                    text: 'Average Number of People on Gym Queue'
                }
            },
            xAxis: {
                title: {
                    text: 'Day of the Week'
                }
            }
        }
    end
end
