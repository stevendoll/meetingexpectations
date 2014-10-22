require 'rails_helper'

RSpec.describe Group, :type => :model do
  before(:each) { @group = Group.new(name: 'my group') }

  subject { @group }

  it { should respond_to(:name) }

  it "#name returns a string" do
    expect(@group.name).to match 'my group'
  end
end
