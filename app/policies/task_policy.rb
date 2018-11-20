class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.tasks
    end
  end
end
