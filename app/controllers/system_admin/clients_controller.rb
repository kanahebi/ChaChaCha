class SystemAdmin::ClientsController < ApplicationController
  before_action :set_system_admin_client, only: [:show, :edit, :update, :destroy]

  # GET /system_admin/clients
  # GET /system_admin/clients.json
  def index
    @system_admin_clients = SystemAdmin::Client.all
  end

  # GET /system_admin/clients/1
  # GET /system_admin/clients/1.json
  def show
  end

  # GET /system_admin/clients/new
  def new
    @system_admin_client = SystemAdmin::Client.new
  end

  # GET /system_admin/clients/1/edit
  def edit
  end

  # POST /system_admin/clients
  # POST /system_admin/clients.json
  def create
    @system_admin_client = SystemAdmin::Client.new(system_admin_client_params)

    respond_to do |format|
      if @system_admin_client.save
        format.html { redirect_to @system_admin_client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @system_admin_client }
      else
        format.html { render :new }
        format.json { render json: @system_admin_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /system_admin/clients/1
  # PATCH/PUT /system_admin/clients/1.json
  def update
    respond_to do |format|
      if @system_admin_client.update(system_admin_client_params)
        format.html { redirect_to @system_admin_client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @system_admin_client }
      else
        format.html { render :edit }
        format.json { render json: @system_admin_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /system_admin/clients/1
  # DELETE /system_admin/clients/1.json
  def destroy
    @system_admin_client.destroy
    respond_to do |format|
      format.html { redirect_to system_admin_clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_system_admin_client
      @system_admin_client = SystemAdmin::Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def system_admin_client_params
      params.fetch(:system_admin_client, {})
    end
end
