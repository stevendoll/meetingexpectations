require'rails_helper' 

describe API::V1::MeetingsController do

  # needed to show jbuilder data
  render_views

  describe 'GET #index' do

    it "ME-147 ME-124 shows success with valid authentication token and email" do
      meeting = FactoryGirl.create(:meeting)
      user = FactoryGirl.create(:user)

      auth_with_user(user)

      get :index

      expect(response).to be_success   # test for the 200 status-code
      expect(response.body).to have_content meeting.name
    end

    it "ME-124 renders the :index template" do
      meeting = FactoryGirl.create(:meeting_with_participants)
      user = FactoryGirl.create(:user)

      auth_with_user(user)

      get :index

      expect(response).to be_success   # test for the 200 status-code
      expect(response.body).to have_content meeting.description
      expect(response.body).to have_content 'person11@example.com'
      #expect(response.body).to have_content meeting.agenda_items
      #expect(json).to have_key('description')
      #expect(json['participants'].count).to eq(5)
    end

  end
  describe 'POST #create' do

    it "ME-124 creates a meeting with a valid name and user"
    it "ME-124 renders the :show template"
    it "ME-124 not create meeting information with invalid user" 
    it "ME-124 adds participants"
    it "ME-124 adds agenda items"
    it "ME-124 adds tasks"

  end

  describe 'PATCH #update' do

    it "ME-124 updates meeting information with valid user"
    it "ME-124 not update meeting information with invalid user" 
    it "ME-124 updates participants"
    it "ME-124 updates agenda items"
    it "ME-124 updates tasks"

  end

end
