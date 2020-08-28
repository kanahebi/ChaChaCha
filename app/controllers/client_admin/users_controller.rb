# frozen_string_literal: true

class ClientAdmin::UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    authorize [:client_admin, :user]

    @users = policy_scope([:client_admin, User])
  end

  def new
    authorize [:client_admin, :user]

    @user = User.new
  end

  def edit
    authorize [:client_admin, @user]
  end

  def create
    authorize [:client_admin, :user]

    @user = User.new(user_params)

    if @user.save
      redirect_to client_admin_users_url, notice: t("helpers.done.create")
    else
      render :new
    end
  end

  def update
    authorize [:client_admin, @user]

    if @user.update(user_params)
      redirect_to client_admin_users_url, notice: t("helpers.done.update")
    else
      render :edit
    end
  end

  def destroy
    authorize [:client_admin, @user]

    @user.destroy
    redirect_to client_admin_users_url, notice: t("helpers.done.destroy")
  end

  private

  def set_user
    @user = policy_scope([:client_admin, User]).find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :client_id,
      :department_id,
      :unique_name,
      :name,
      :password,
      :password_confirmation,
      :role,
      :created_at,
      :updated_at
    )
  end
end
