# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :device do
    device_type "My device type"
    device_token "My device token"
    user
  end
end
