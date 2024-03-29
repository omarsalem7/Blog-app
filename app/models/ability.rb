class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all if user.nil?
    return if user.nil?

    can :manage, :all if user.role == 'admin'
    can :read, :all if user.role == 'user'
    can :manage, Post, user_id: user.id
    can :manage, Comment, user_id: user.id
  end
end
