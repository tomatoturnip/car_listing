require 'spec_helper'

feature 'delete a manufacturer' do
  scenario 'delete a manufacturer' do
    FactoryGirl.create(:car)
    visit manufacturers_path
    manufacturer_count = Manufacturer.count
    expect(page).to have_content('VW')

    click_on 'Destroy VW'
    expect(page).to_not have_content('VW')
    expect(Manufacturer.count).to eql(manufacturer_count - 1)
  end
end
