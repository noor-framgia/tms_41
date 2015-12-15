class Ability
  include CanCan::Ability

  def initialize(user)
    # Permission will be stricter once all the resource will be available.
    # Now only the "cancancan" is initialize with its working version.
    user ||= User.new
    if user.supervisor?
      can :manage, :all
    else
      can :manage, :all
    end
  end
end
