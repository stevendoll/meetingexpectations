describe User do

  before(:each) { @user = User.new(email: 'user@example.com') }

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

  # it "is invalid without a password" do 
  #   user = User.new(password: nil) 
  #   user.valid? 
  #   expect(user.errors[:password]).to include("can't be blank") 
  # end

  it "is invalid without an email" do 
    user = User.new(email: nil) 
    user.valid? 
    expect(user.errors[:email]).to include("can't be blank") 
  end

  it "is invalid with a duplicate email address" do
    User.create(
      first_name: 'Joe', last_name: 'Tester',
      email: 'tester@example.com'
    )
    user = User.new(
     first_name: 'Jane', last_name: 'Tester',
     email: 'tester@example.com'
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "returns a user's full name as a string" do
    user = User.new(first_name: 'John', last_name: 'Doe', email: 'johndoe@example.com')
    expect(user.full_name).to eq 'John Doe'
  end
end
