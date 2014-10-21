# spec/requests/api/v1/registrations_spec.rb
describe "Registrations API" do
  it 'gets a user token' do
    #FactoryGirl.create_list(:message, 10)

    get '/api/v1/registrations'

    expect(response).to be_success            # test for the 200 status-code
    expect(json['messages'].length).to eq(10) # check to make sure the right amount of messages are returned
  end
end