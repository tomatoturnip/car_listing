# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    color "MyString"
    year "MyString"
    mileage "MyString"
    description "MyString"
  end
end
