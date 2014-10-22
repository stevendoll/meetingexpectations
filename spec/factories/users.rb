FactoryGirl.define do
  sequence(:email) { |n| "person#{n}@example.com" }

  factory :user, aliases: [:creator] do
    confirmed_at Time.now
    name "Test User"
    email
    password "please123"

    trait :admin do
      role 'admin'
    end

  end
end
