# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :agenda_item do
    ends_at "2014-10-21 14:31:11"
    starts_at "2014-10-21 14:31:11"
    completed false
    trashed false
    description "MyText"
    position 1.5
    presenter "MyString"
    name "MyText"
    meeting_id ""
  end
end
