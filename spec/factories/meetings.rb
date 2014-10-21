# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meeting do
    name "MyText"
    description "MyText"
    trashed false
    template false
    draft false
    archived false
    completed false
    privacy "MyText"
    starts_at "2014-10-21 14:30:33"
    ends_at "2014-10-21 14:30:33"
    all_day false
    creator_id ""
    account_id ""
    location_id ""
    location_comments "MyText"
    color "MyString"
  end
end
