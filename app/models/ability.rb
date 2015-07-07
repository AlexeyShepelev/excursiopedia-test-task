class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    send(user.try(:role_humanize).try(:underscore) || :guest)
  end

  def admin
    can :manage, :all
  end

  def moderator
    user
    can :read, ActiveAdmin::Page, name: 'Dashboard'
    can [:read, :update], Excursion
  end

  def user
    guest
  end

  def guest
  end
end
