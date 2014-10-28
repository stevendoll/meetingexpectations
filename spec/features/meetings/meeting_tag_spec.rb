include Warden::Test::Helpers
Warden.test_mode!

# Feature: Meeting tags
#   As a user
#   I want to tag meetings
#   So I can group and sort meetings in a flexible way
feature 'Meeting tags', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User can view the meeting tags
  #   Given I am signed in
  #   Given I create a meeting
  #   When I visit the meeting show page
  #   And the meeting has a tag
  #   I can see the tag
  scenario 'ME-148 user can see tags to a meeting' do
    meeting = FactoryGirl.create(:meeting_with_tags)
    user = meeting.creator #creator can see the meeting
    login_as(user, :scope => :user)
    visit meeting_path(meeting)
    expect(page).to have_content 'tag1'
    expect(page).to have_content 'tag2'
  end

  # Scenario: User can tag a meeting
  #   Given I am signed in
  #   Given I create a meeting
  #   When I visit the meeting edit page
  #   I can select a tag
  #   And add the tag to a meeting
  scenario 'ME-148 user can add a tag to a meeting' do
    meeting = FactoryGirl.create(:meeting_with_tags)
    user = meeting.creator #creator can see the meeting
    login_as(user, :scope => :user)
    visit edit_meeting_path(meeting)
    fill_in 'Tag list', :with => 'tag1, tag2'
    click_button 'Update'
    expect(page).to have_content 'updated'
    expect(page).to have_content 'tag1'
    expect(page).to have_content 'tag2'
  end

end