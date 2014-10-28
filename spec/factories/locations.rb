# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    name "My location"
    address_1 "MyText"
    address_2 "MyText"
    city "MyString"
    state "MyString"
    zip "MyString"
    account
  end
end
