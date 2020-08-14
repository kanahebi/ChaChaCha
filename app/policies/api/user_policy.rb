class Api::UserPolicy < ApplicationPolicy
  def index?
    true
  end

  class Scope < Scope
    def resolve
      scope.where(department_id: user.department_id).all
    end
  end
end
