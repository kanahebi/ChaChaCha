# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :require_login
  after_action :verify_authorized

  helper_method :current_user, :logged_in?

  private

  def logged_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end

  def pundit_user
    current_user
  end

  def user_not_authorized(exception)
    render file: Rails.root.join('public/404.html'), layout: false, status: :not_found
  end
end
