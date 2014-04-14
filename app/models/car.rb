class Car < ActiveRecord::Base
  belongs_to :manufacturer
  validates :color, presence: true
  validates :year, presence: true, inclusion: { in: '1980'..'2015' }
  validates :mileage, presence: true
end
