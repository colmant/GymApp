require 'rails_helper'

feature "Signing in" do
  background do
    User.create!(email: 'user@example.com', password: '123456')
    User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "colgate13")
    Gym.create!(:name => "Trudy", :top_floor_occupancy => 0, :bottom_floor_occupancy => 0, :top_floor_capacity => 25, :bottom_floor_capacity => 20, :wait_top_floor => 0, :wait_bottom_floor => 0)
  end

  scenario "with correct credentials" do
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_current_path('/')
  end

  scenario "as unknown user" do
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', with: 'xxx@gmail.com'
      fill_in 'Password', with: 'fake_pword'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
    expect(page).to have_current_path(new_user_session_path)
  end
  
  scenario "as admin user" do
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', with: 'admin@colgate.edu'
      fill_in 'Password', with: 'colgate13'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_current_path('/')
    expect(page).to have_link("Admin Page")
  end
  
end


