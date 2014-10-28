Warden.test_mode!
# Feature: User index page
#   As a user
#   I want to see a list of users
#   So I can see who has registered
feature 'Dashboard', :devise do

  after(:each) do
    Warden.test_reset!
  end


  # Scenario: User listed on index page
  #   Given I am signed in
  #   When I visit the user index page
  #   Then I see my own email address
  scenario 'view dashboard links' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    visit root_path
    expect(page).to have_content user.email
    expect(page).to have_content 'Meetings'
  end

end

