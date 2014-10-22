# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :device do
    device_type "MyString"
    device_token "MyString"
    user
  end
end
