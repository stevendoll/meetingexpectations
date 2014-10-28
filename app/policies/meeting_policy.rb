class MeetingPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
        #scope.where(:account => user.account)
      else
        scope.where(:account => user.account)
      end
    end
  end

  attr_reader :user, :meeting

  def initialize(user, meeting)
    @user = user
    @meeting = meeting
  end

  def index?
    @user.admin?
  end

  def new?
    @user.admin? or @user.account == @meeting.account
  end

  # def copy?
  #   @user.admin? or @user.account == @meeting.account
  # end

  def show?
    @user.admin? or @user.account == @meeting.account
  end

  def create?
    @user.admin? or @user.account == @meeting.account
  end
  def edit?
    @user.admin? or @user.account == @meeting.account
  end
  def update?
    @user.admin? or @user.account == @meeting.account
  end

  def destroy?
    @user.admin?
  end

end
