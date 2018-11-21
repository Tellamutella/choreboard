class RewardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.rewards # list of user's rewards, scope.all is just Reward.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def update
    @record.user == @user
  end

  def edit?
    update?
  end

  def destroy?
    @record.user == @user
  end
end
