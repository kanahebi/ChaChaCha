# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  before_action :require_login

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
end
