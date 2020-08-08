# frozen_string_literal: true

class RootPolicy < ApplicationPolicy
  def index?
    user.system_admin? || user.client_admin? || user.client_general?
  end
end
