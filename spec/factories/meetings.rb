# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :meeting do
    name "My meeting"
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
    creator
    account
    location
    location_comments "MyText"
    color "MyString"

    factory :meeting_with_participants do
      # posts_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      # transient do
      #   participants_count 5
      # end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |meeting, evaluator|
        create_list(:participant, 5, meeting: meeting)
      end
    end
    factory :meeting_with_nested_objects do
      # posts_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      # transient do
      #   participants_count 5
      # end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |meeting, evaluator|
        create_list(:participant, 5, meeting: meeting)
        create_list(:agenda_item, 5, meeting: meeting)
        create_list(:task, 5, meeting: meeting)
      end
    end
  end
end
