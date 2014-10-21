# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :participant do
    meeting_id ""
    user_id ""
    attended false
    description "MyText"
  end
end
