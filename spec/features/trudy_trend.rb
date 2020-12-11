require 'rails_helper'
background do
        TrudyTrend.create(:time => DateTime.current().change(day: rand(1..7), hour: rand(8..22), min: rand(0..59)))
    end
    scenario "When page clicked" do
        visit('/')
        click_link("Trudy Trends")
        expect(page).to have_current_path(trudy_trends_path)
    end
    
