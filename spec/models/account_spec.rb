require 'rails_helper'

RSpec.describe Account, :type => :model do
  before(:each) { @account = Account.new(name: 'my account') }

  subject { @account }

  it { should respond_to(:name) }

  it "#name returns a string" do
    expect(@account.name).to match 'my account'
  end

  it "is valid with a name, creator" do
    user = FactoryGirl.create(:user)

    account = Account.new(
      name: 'my account',
      creator: user)
    expect(account).to be_valid
  end

  it "is invalid without a name" do
    user = FactoryGirl.create(:user)

    account = Account.new(
      name: '',
      creator: user)
    expect(account).not_to be_valid
  end

  it "is invalid without a creator" do
    account = Account.new(
      name: 'my account')
    expect(account).not_to be_valid
  end

end
