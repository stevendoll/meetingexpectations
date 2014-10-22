require 'rails_helper'

RSpec.describe Participant, :type => :model do
  before(:each) { @participant = Participant.new(user_id: 'test task') }

  subject { @participant }

  it { should respond_to(:user_id) }

  it "#user_id returns a string" do
    expect(@participant.user_id).to match 'test task'
  end
end
