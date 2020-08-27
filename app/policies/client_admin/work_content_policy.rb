# frozen_string_literal: true

class ClientAdmin::WorkContentPolicy < ClientAdmin::ApplicationPolicy
  class Scope < ClientAdmin::ApplicationPolicy
    attr_reader :user, :scope

    def initialize(user, scope)
      super

      @user = user
      @scope = scope
    end

    def resolve
      if user.system_admin?
        scope.all
      elsif user.client_admin?
        scope.where(client_id: user.client_id)
      else
        scope.none
      end
    end
  end
end
