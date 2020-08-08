# frozen_string_literal: true

class SessionPolicy < ApplicationPolicy
  def create?
    true
  end

  def new?
    true
  end

  def destroy?
    user
  end
end
