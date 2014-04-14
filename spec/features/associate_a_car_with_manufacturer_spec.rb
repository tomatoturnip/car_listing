require 'spec_helper'

feature 'associate a car with its manufacturer', %Q{
  As a car salesperson
  I want to record a car listing's manufacturer
  So that I can keep track of its manufacturer
} do

  scenario 'create a car' do
    manufacturer = FactoryGirl.create(:manufacturer)
    car = FactoryGirl.build(:car, manufacturer: nil)
    visit new_car_path
    fill_in 'Color', with: car.color
    select car.year, from: 'Year'
    fill_in 'Mileage', with: car.mileage
    fill_in 'Description', with: car.description
    select manufacturer.name, from: 'Manufacturer'

    click_on 'Create Car'

    expect(page).to have_content("Successfully created car")
    expect(Car.last.manufacturer).to eql(manufacturer)
  end
end
