# frozen_string_literal: true

class ClientAdmin::RootPolicy < ClientAdmin::ApplicationPolicy
  def index?
    user.system_admin? || user.client_admin?
  end
end
