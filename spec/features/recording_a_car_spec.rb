require 'spec_helper'

feature 'record a car', %Q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
  } do

# Acceptance Criteria:

# * I must specify the color, year, and mileage of the car.
# * Only years from 1980 and above can be specified.
# * I can optionally specify a description of the car.
# * If I enter all of the required information in the required formats, the car is recorded.
# * If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
# * Upon successfully creating a car, I am redirected so that I can create another car.

  scenario 'creating a car' do
    visit new_car_path
    expect(page).to have_content('Create a new car')
    fill_in 'Color', with: 'Black'
    select '2006', from: 'Year'
    fill_in 'Mileage', with: '100000'
    fill_in 'Description', with: 'A rather ugly car'


    click_button 'Create Car'
    expect(page).to have_content("Successfully created car")
    expect(current_path).to eql(new_car_path)
  end

  scenario 'create an invalid car record' do
    visit new_car_path

    click_button 'Create Car'
    expect(page).to have_content("can't be blank")
  end
end
