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
        #scope.where(:enterprise => user.enterprise)
      else
        scope.where(:enterprise => user.enterprise)
      end
    end
  end

  attr_reader :user, :node

  def initialize(user, node)
    @user = user
    @node = node
  end

  def index?
    @user.admin?
  end

  def new?
    @user.admin? or @user.enterprise == @node.enterprise
  end

  def copy?
    @user.admin? or @user.enterprise == @node.enterprise
  end
  def show?
    @user.admin? or @user.enterprise == @node.enterprise
  end

  def canvas?
    @user.admin? or @user.enterprise == @node.enterprise
  end

  def mountain?
    @user.admin? or @user.enterprise == @node.enterprise
  end

  def mountain_share?
    @user.admin? or @user.enterprise == @node.enterprise
  end

  def activities?
    @user.admin? or @user.enterprise == @node.enterprise
  end

  def create?
    @user.admin? or @user.enterprise == @node.enterprise
  end
  def edit?
    @user.admin? or @user.enterprise == @node.enterprise
  end
  def update?
    @user.admin? or @user.enterprise == @node.enterprise
  end

  def destroy?
    @user.admin?
  end

end
