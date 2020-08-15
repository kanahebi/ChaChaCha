# frozen_string_literal: true

class SystemAdmin::ClientsController < ApplicationController
  before_action :set_client, only: [:edit, :update, :destroy]

  def index
    authorize [:system_admin, :client]

    @clients = Client.all
  end

  def new
    authorize [:system_admin, :client]

    @client = Client.new
  end

  def edit
    authorize [:system_admin, @client]
  end

  def create
    authorize [:system_admin, :client]

    @client = Client.new(client_params)

    if @client.save
      redirect_to system_admin_clients_url, notice: t("helpers.done.create")
    else
      render :new
    end
  end

  def update
    authorize [:system_admin, @client]

    if @client.update(client_params)
      redirect_to system_admin_clients_url, notice: t("helpers.done.update")
    else
      render :edit
    end
  end

  def destroy
    authorize [:system_admin, @client]

    @client.destroy
    redirect_to system_admin_clients_url, notice: t("helpers.done.destroy")
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(
      :name,
      :users_limit
    )
  end
end
