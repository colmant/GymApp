class TrudyTrend < ApplicationRecord
    def self.sorted_by(field) #need to add default sorting by current day/date?
        if TrudyTrend.column_names.include?(field.to_s) #Date.today.strftime("%A")
            return Product.order(field.to_s)
        elsif field.to_s =="age"
            return Product.order('minimum_age_appropriate')
        else
            return Product.order(:name)
        end
    end
end
