# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group, aliases: [:parent_group] do
    name "My group"
    account
    creator
    parent_group
  end
end
