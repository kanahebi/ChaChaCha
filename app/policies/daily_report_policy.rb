class DailyReportPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    return false if record.user_id != user.id

    true
  end

  def edit?
    update?
  end
end
