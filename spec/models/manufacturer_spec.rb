require 'spec_helper'

describe Manufacturer do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:country) }

  it 'should nullify its dependents' do
    manufacturer = FactoryGirl.create(:manufacturer)
    car = FactoryGirl.create(:car, manufacturer: manufacturer)
    car_count = Car.count
    expect(car.manufacturer).to eql(manufacturer)
    manufacturer.destroy
    car.reload
    expect(car.manufacturer).to eql(nil)
    expect(Car.count).to eql(car_count)
  end
end
