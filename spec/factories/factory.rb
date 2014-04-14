# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    color "Yellow"
    year "2002"
    mileage "120000"
    description "a yellow bug"
    manufacturer
  end

  factory :manufacturer do
    name "VW"
    country "Germany"
  end
end
