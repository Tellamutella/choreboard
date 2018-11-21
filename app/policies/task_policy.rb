class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.tasks

    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    true
  end

  def update
    true
  end
end
