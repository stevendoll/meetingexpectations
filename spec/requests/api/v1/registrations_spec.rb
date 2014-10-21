# Feature: API Registrations
#   As a user
#   I want to sign in
#   So I can visit protected areas of the site
feature 'API Registrations', :devise do

  # Scenario: User cannot sign in if not registered
  #   Given I do not exist as a user
  #   When I sign in with valid credentials
  #   Then I see an invalid credentials message
  scenario 'user cannot sign in if not registered' do

    request.headers['X-USER-TOKEN'] = 'please123'
    request.headers['X-USER-EMAIL'] = 'test@example.com'

    get '/api/v1/registrations'

    expect(response).to be_success            # test for the 200 status-code
    json = JSON.parse(response.body)
    expect(json['email'].to eq('test@example.com'))
  end

  # Scenario: User can sign in with valid credentials
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with valid credentials
  #   Then I see a success message
  scenario 'user gets token with valid credentials' do
    user = FactoryGirl.create(:user)

    # request.headers['X-USER-TOKEN'] = user.password
    # request.headers['X-USER-EMAIL'] = user.email

    get '/api/v1/registrations', { 'Content-Type' => 'application/json', 'X-USER-TOKEN' => user.authentication_token, 'X-USER-EMAIL' => user.email }

    expect(response).to be_success            # test for the 200 status-code
    json = JSON.parse(response.body)
    expect(json['email'].to eq(user.email) )
  end

  # Scenario: User cannot sign in with wrong email
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with a wrong email
  #   Then I see an invalid email message
  scenario 'user cannot sign in with wrong email' do
    user = FactoryGirl.create(:user)
    signin('invalid@email.com', user.password)
    expect(page).to have_content I18n.t 'devise.failure.not_found_in_database', authentication_keys: 'email'
  end

  # Scenario: User cannot sign in with wrong password
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with a wrong password
  #   Then I see an invalid password message
  scenario 'user cannot sign in with wrong password' do
    user = FactoryGirl.create(:user)
    signin(user.email, 'invalidpass')
    expect(page).to have_content I18n.t 'devise.failure.invalid', authentication_keys: 'email'
  end

end