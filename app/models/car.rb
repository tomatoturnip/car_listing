class Car < ActiveRecord::Base
  validates :color, presence: true
  validates :year, presence: true, inclusion: { in: '1980'..'2015' }
  validates :mileage, presence: true
end
