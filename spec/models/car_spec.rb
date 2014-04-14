require 'spec_helper'

describe Car do
  it { should validate_presence_of(:color) }
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:mileage) }
  it { should ensure_inclusion_of(:year).in_array('1980'..'2015') }
  it { should belong_to(:manufacturer) }
end
