# frozen_string_literal: true

class ClientAdmin::DepartmentsController < ApplicationController
  before_action :set_department, only: [:edit, :update, :destroy]

  def index
    authorize [:client_admin, :department]

    @departments = policy_scope([:client_admin, Department])
  end

  def new
    authorize [:client_admin, :department]

    @department = Department.new
  end

  def edit
    authorize [:client_admin, @department]
  end

  def create
    authorize [:client_admin, :department]

    @department = Department.new(department_params)

    if @department.save
      redirect_to client_admin_departments_url, notice: t("helpers.done.create")
    else
      render :new
    end
  end

  def update
    authorize [:client_admin, @department]

    if @department.update(department_params)
      redirect_to client_admin_departments_url, notice: t("helpers.done.update")
    else
      render :edit
    end
  end

  def destroy
    authorize [:client_admin, @department]

    @department.destroy
    redirect_to client_admin_departments_url, notice: t("helpers.done.destroy")
  end

  private

  def set_department
    @department = policy_scope([:client_admin, Department]).find(params[:id])
  end

  def department_params
    params.require(:department).permit(
      :name,
      :client_id
    )
  end
end
