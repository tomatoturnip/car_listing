require 'spec_helper'

describe Manufacturer do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:country) }
end
