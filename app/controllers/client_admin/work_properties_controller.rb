# frozen_string_literal: true

class ClientAdmin::WorkPropertiesController < ApplicationController
  before_action :set_work_property, only: [:edit, :update, :destroy]

  def index
    authorize [:client_admin, :work_property]

    @work_properties = policy_scope([:client_admin, WorkProperty])
  end

  def new
    authorize [:client_admin, :work_property]

    @work_property = WorkProperty.new
  end

  def edit
    authorize [:client_admin, @work_property]
  end

  def create
    authorize [:client_admin, :work_property]

    @work_property = WorkProperty.new(work_property_params)

    if @work_property.save
      redirect_to client_admin_work_properties_url, notice: t("helpers.done.create")
    else
      render :new
    end
  end

  def update
    authorize [:client_admin, @work_property]

    if @work_property.update(work_property_params)
      redirect_to client_admin_work_properties_url, notice: t("helpers.done.update")
    else
      render :edit
    end
  end

  def destroy
    authorize [:client_admin, @work_property]

    @work_property.destroy
    redirect_to client_admin_work_properties_url, notice: t("helpers.done.destroy")
  end

  private

  def set_work_property
    @work_property = policy_scope([:client_admin, WorkProperty]).find(params[:id])
  end

  def work_property_params
    params.require(:work_property).permit(
      :name,
      :code,
      :active,
      :client_id
    )
  end
end
