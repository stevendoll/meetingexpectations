require'rails_helper' 

describe API::V1::RegistrationsController do
  
  # needed to show jbuilder data
  render_views
  
  describe 'GET #index' do

    it "shows the user with authentication token with valid email and password" do
      user = FactoryGirl.create(:user, email: 'test@example.com')

      http_login      
      get :index, {}, @env

      expect(response).to be_success   # test for the 200 status-code
      expect(response.body).to have_content user.email
      expect(response.body).to have_content user.authentication_token
    end

    it "renders the :show template" do
      user = FactoryGirl.create(:user, email: 'test@example.com')

      http_login      
      get :index, {}, @env

      expect(response).to be_success   # test for the 200 status-code
      expect(response.body).to have_content user.email
      expect(response.body).to have_content user.authentication_token
    end

  end
  describe 'POST #create' do

    it "creates a user with a valid email and password"
    it "renders the :show template"

  end

  describe 'PATCH #profile' do

    it "updates user information with valid email and token"
    it "updates avatar if included"
    it "renders the :show template"
    it "ignores avatar if not included"
    it "not update user information with invalid token"
    it "not update user information with invalid email" 

  end

end
