# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    name "MyString"
    account_id ""
    creator_id ""
    parent_group_id ""
  end
end
