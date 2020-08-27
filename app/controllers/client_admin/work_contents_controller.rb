# frozen_string_literal: true

class ClientAdmin::WorkContentsController < ApplicationController
  before_action :set_work_content, only: [:edit, :update, :destroy]

  def index
    authorize [:client_admin, :work_content]

    @work_contents = policy_scope([:client_admin, WorkContent])
  end

  def new
    authorize [:client_admin, :work_content]

    @work_content = WorkContent.new
  end

  def edit
    authorize [:client_admin, @work_content]
  end

  def create
    authorize [:client_admin, :work_content]

    @work_content = WorkContent.new(work_content_params)

    if @work_content.save
      redirect_to client_admin_work_contents_url, notice: t("helpers.done.create")
    else
      render :new
    end
  end

  def update
    authorize [:client_admin, @work_content]

    if @work_content.update(work_content_params)
      redirect_to client_admin_work_contents_url, notice: t("helpers.done.update")
    else
      render :edit
    end
  end

  def destroy
    authorize [:client_admin, @work_content]

    @work_content.destroy
    redirect_to client_admin_work_contents_url, notice: t("helpers.done.destroy")
  end

  private

  def set_work_content
    @work_content = policy_scope([:client_admin, WorkContent]).find(params[:id])
  end

  def work_content_params
    params.require(:work_content).permit(
      :name,
      :name_kana,
      :active,
      :client_id
    )
  end
end
