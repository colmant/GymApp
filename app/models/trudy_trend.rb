class TrudyTrend < ApplicationRecord
<<<<<<< HEAD
def change 
    create_table :times do |t|
        t.timestamps
    end 
end
=======
    def self.sorted_by(field) #need to add default sorting by current day/date?
        if TrudyTrend.column_names.include?(field.to_s) #Date.today.strftime("%A")
            return TrudyTrend.order(field.to_s)
        elsif field.to_s =="age"
            return TrudyTrend.order('minimum_age_appropriate')
        else
            return TrudyTrend.order(:name)
        end
    end
    
    def get_average_queue_time
        @trudy_trend = TrudyTrend.find_by(name: Date.today.strftime("%A")).average_queue_time
    end
    
    def get_average_queue_size
        @trudy_trend = TrudyTrend.find_by(name: Date.today.strftime("%A")).average_queue_size
    end
>>>>>>> b5fc4fd8e20b01db97431ec5e9886162fa559d7e
end
