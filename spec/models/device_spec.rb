require 'rails_helper'

RSpec.describe Device, :type => :model do
  before(:each) { @device = Device.new(user_id: 'asdf') }

  subject { @device }

  it { should respond_to(:user_id) }

  it "#user_id returns a uuid" do
    expect(@device.user_id).to match 'asdf'
  end
end
