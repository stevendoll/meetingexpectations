require 'rails_helper'

RSpec.describe Task, :type => :model do
  before(:each) { @task = Task.new(name: 'test task') }

  subject { @task }

  it { should respond_to(:name) }

  it "#name returns a string" do
    expect(@task.name).to match 'test task'
  end
end
