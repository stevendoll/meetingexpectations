require 'rails_helper'

RSpec.describe Meeting, :type => :model do
  before(:each) { @meeting = Meeting.new(name: 'my meeting') }

  subject { @meeting }

  it { should respond_to(:name) }

  it "ME-145 #name returns a string" do
    expect(@meeting.name).to match 'my meeting'
  end

  it "is valid with a name, account" do
    test_account = FactoryGirl.create(:account)

    meeting = Meeting.new(
      name: 'my meeting',
      account: test_account)
    expect(meeting).to be_valid
  end

  it "is invalid without a name" do
    test_account = FactoryGirl.create(:account)

    meeting = Meeting.new(
      name: '',
      account: test_account)
    expect(meeting).not_to be_valid
  end

  it "is invalid without an account" do
    test_account = FactoryGirl.create(:account)

    meeting = Meeting.new(
      name: 'my meeting')
    expect(meeting).not_to be_valid
  end

end
