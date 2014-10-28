require 'rails_helper'

RSpec.describe Group, :type => :model do
  before(:each) { @group = Group.new(name: 'my group') }

  subject { @group }

  it { should respond_to(:name) }

  it "ME-145 #name returns a string" do
    expect(@group.name).to match 'my group'
  end
end
