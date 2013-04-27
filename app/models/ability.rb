class Ability
  include CanCan::Ability

  def initialize(user)
    current_user ||= User.new

    if user.is? :admin
      can :manage, :all
    else
      can :read, :all
    end
  end
end
