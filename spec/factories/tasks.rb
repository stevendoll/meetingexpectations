# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    name "My task"
    description "MyText"
    planned_start "2014-10-21 14:49:14"
    planned_end "2014-10-21 14:49:14"
    trashed false
    position 1.5
    meeting
  end
end
