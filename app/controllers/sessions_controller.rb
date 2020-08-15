# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  skip_after_action :verify_authorized, only: [:new, :create]

  def new
    if logged_in?
      redirect_to root_url
      return
    end

    @session = Session.new
  end

  def create
    @session = Session.new(session_params)

    succeeded = @session.valid?
    if succeeded
      session_rotation
      session[:user_id] = @session.user.id

      redirect_to view_context.root_path_judged_by_role
    else
      render :new
    end
  end

  def destroy
    authorize Session

    session_rotation
    session.delete(:user_id)
    @current_user = nil
    redirect_to new_session_url, notice: t(".done")
  end

  private

  def session_params
    params.require(:session).permit(:unique_name, :password)
  end

  # https://railsguides.jp/security.html
  # https://github.com/Sorcery/sorcery/blob/eea7a1c852a9da8a6729cedacd7c4c292a2897d7/lib/sorcery/controller.rb#L43
  def session_rotation
    old_session = session.dup.to_hash
    reset_session
    old_session.each_pair do |k, v|
      session[k.to_sym] = v
    end
  end
end
