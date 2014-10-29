include Warden::Test::Helpers
Warden.test_mode!

# Feature: Meeting show page
#   As a user
#   I want to visit a meeting page
#   So I can see information about the meeting
feature 'Meeting show page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User sees own profile
  #   Given I am signed in
  #   When I visit the user profile page
  #   Then I see the meeting general information
  scenario 'ME-152 admin user sees meeting show page' do
    user = FactoryGirl.create(:user, :admin)
    meeting = FactoryGirl.create(:meeting)
    login_as(user, :scope => :user)
    visit meeting_path(meeting)
    expect(page).to have_content meeting.name
    expect(page).to have_content meeting.description
  end

  # Scenario: User sees own profile
  #   Given I am signed in
  #   When I visit the user profile page
  #   Then I see the meeting general information
  scenario 'ME-152 admin user sees participants on meeting show page' do
    user = FactoryGirl.create(:user, :admin)
    meeting = FactoryGirl.create(:meeting_with_nested_objects)
    some_participant = meeting.participants.first
    login_as(user, :scope => :user)
    visit meeting_path(meeting)
    expect(page).to have_content meeting.name
    expect(page).to have_content some_participant.user.email
  end

  # Scenario: User sees own profile
  #   Given I am signed in
  #   When I visit the user profile page
  #   Then I see the meeting general information
  scenario 'ME-152 admin user sees agenda items on meeting show page' do
    user = FactoryGirl.create(:user, :admin)
    meeting = FactoryGirl.create(:meeting_with_nested_objects)
    login_as(user, :scope => :user)
    visit meeting_path(meeting)
    expect(page).to have_content meeting.name
    expect(page).to have_content 'My agenda item'
  end

  # Scenario: User sees own profile
  #   Given I am signed in
  #   When I visit the user profile page
  #   Then I see the meeting general information
  scenario 'ME-152 admin user sees tasks on meeting show page' do
    user = FactoryGirl.create(:user, :admin)
    meeting = FactoryGirl.create(:meeting_with_nested_objects)
    login_as(user, :scope => :user)
    visit meeting_path(meeting)
    expect(page).to have_content meeting.name
    expect(page).to have_content 'My task'
  end

  # Scenario: User cannot see another user's profile
  #   Given I am signed in
  #   When I visit another user's profile
  #   Then I see an 'access denied' message
  scenario "ME-153 regular user cannot see a meeting if not creator or participant" do
    me = FactoryGirl.create(:user)
    meeting = FactoryGirl.create(:meeting)
    login_as(me, :scope => :user)
    #Capybara.current_session.driver.header 'Referer', root_path
    visit meeting_path(meeting)
    expect(page).to have_content 'Access denied.'
  end

  scenario "ME-153 regular user can see meeting if creator" do
    my_meeting = FactoryGirl.create(:meeting)
    not_my_meeting = FactoryGirl.create(:meeting)
    me = my_meeting.creator
    login_as(me, :scope => :user)
    Capybara.current_session.driver.header 'Referer', root_path
    visit meeting_path(my_meeting)
    expect(page).to have_content my_meeting.name
    visit meeting_path(not_my_meeting)
    expect(page).to have_content 'Access denied.'
  end


  scenario "ME-153 regular user can see meeting if participant" do
    my_meeting = FactoryGirl.create(:meeting_with_nested_objects)
    not_my_meeting = FactoryGirl.create(:meeting)
    me = FactoryGirl.create(:user, :admin)
    #my_meeting.participants << me
    me = my_meeting.participants.first.user
    login_as(me, :scope => :user)
    Capybara.current_session.driver.header 'Referer', root_path
    visit meeting_path(my_meeting)
    expect(page).to have_content my_meeting.name
    visit meeting_path(not_my_meeting)
    expect(page).to have_content 'Access denied.'
  end


end