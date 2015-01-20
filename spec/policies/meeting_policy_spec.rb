describe MeetingPolicy do
  subject { MeetingPolicy }

  let (:current_user) { FactoryGirl.build_stubbed :user }
  let (:other_user) { FactoryGirl.build_stubbed :user }
  let (:admin) { FactoryGirl.build_stubbed :user, :admin }

  permissions :index? do
    it "allows you to see meetings you have created"

    it "allows you to see meetings you are a participant"

    it "allows an admin to see all meetings"
  end

  permissions :show? do
    it "allows you to see meetings you have created"

    it "allows you to see meetings you are a participant"

    it "allows an admin to see all meetings"
  end

  permissions :update? do
    it "prevents updates if not an admin" do
      expect(subject).not_to permit(current_user)
    end
    it "allows an admin to make updates" do
      expect(subject).to permit(admin)
    end
  end

  permissions :destroy? do
    it "prevents deleting yourself" do
      expect(subject).not_to permit(current_user, current_user)
    end
    it "allows an admin to delete any user" do
      expect(subject).to permit(admin, other_user)
    end
  end

end
