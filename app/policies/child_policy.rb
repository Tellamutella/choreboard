class ChildPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.parent == user
  end

  def new?
    create?
  end
end
