require 'spec_helper'

feature 'record a car manufacturer', %Q{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
} do

  # Acceptance Criteria:

  # * I must specify a manufacturer name and country.
  # * If I do not specify the required information, I am presented with errors.
  # * If I specify the required information, the manufacturer is recorded and I am redirected to enter another new manufacturer.

  scenario 'create a manufacturer' do
    visit new_manufacturer_path
    expect(page).to have_content('Create a new manufacturer')
    fill_in 'Name', with: 'Black'
    fill_in 'Country', with: 'Germany'

    click_button 'Create Manufacturer'
    expect(page).to have_content("Successfully created manufacturer")
    expect(current_path).to eql(new_manufacturer_path)
  end

  scenario 'create an invalid manufacturer record' do
    visit new_manufacturer_path

    click_button 'Create Manufacturer'
    expect(page).to have_content("can't be blank")
  end

end

