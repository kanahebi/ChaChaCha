# frozen_string_literal: true

class ClientAdmin::ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, "ログインしてください" unless user

    @user = user
    @record = record
  end

  def index?
    user.system_admin? || user.client_admin?
  end

  def show?
    user.system_admin? || user.client_admin?
  end

  def create?
    user.system_admin? || user.client_admin?
  end

  def new?
    create?
  end

  def update?
    user.system_admin? || user.client_admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.system_admin? || user.client_admin?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      super
      raise Pundit::NotAuthorizedError, "ログインしてください" unless user

      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
