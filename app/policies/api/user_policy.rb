class Api::UserPolicy < ApplicationPolicy
  def index?
    true
  end
end
