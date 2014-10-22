require 'rails_helper'

RSpec.describe Location, :type => :model do
  before(:each) { @location = Location.new(name: 'my location') }

  subject { @location }

  it { should respond_to(:name) }

  it "#name returns a string" do
    expect(@location.name).to match 'my location'
  end
end
