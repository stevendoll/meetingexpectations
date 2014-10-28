require 'rails_helper'

RSpec.describe AgendaItem, :type => :model do
  before(:each) { @agenda_item = AgendaItem.new(name: 'my agenda item') }

  subject { @agenda_item }

  it { should respond_to(:name) }

  it "ME-145 #name returns a string" do
    expect(@agenda_item.name).to match 'my agenda item'
  end
end
