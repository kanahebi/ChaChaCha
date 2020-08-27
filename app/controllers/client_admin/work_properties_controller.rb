class ClientAdmin::WorkPropertiesController < ApplicationController
  before_action :set_client_admin_work_property, only: [:show, :edit, :update, :destroy]

  # GET /client_admin/work_properties
  # GET /client_admin/work_properties.json
  def index
    @client_admin_work_properties = ClientAdmin::WorkProperty.all
  end

  # GET /client_admin/work_properties/1
  # GET /client_admin/work_properties/1.json
  def show
  end

  # GET /client_admin/work_properties/new
  def new
    @client_admin_work_property = ClientAdmin::WorkProperty.new
  end

  # GET /client_admin/work_properties/1/edit
  def edit
  end

  # POST /client_admin/work_properties
  # POST /client_admin/work_properties.json
  def create
    @client_admin_work_property = ClientAdmin::WorkProperty.new(client_admin_work_property_params)

    respond_to do |format|
      if @client_admin_work_property.save
        format.html { redirect_to @client_admin_work_property, notice: 'Work property was successfully created.' }
        format.json { render :show, status: :created, location: @client_admin_work_property }
      else
        format.html { render :new }
        format.json { render json: @client_admin_work_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_admin/work_properties/1
  # PATCH/PUT /client_admin/work_properties/1.json
  def update
    respond_to do |format|
      if @client_admin_work_property.update(client_admin_work_property_params)
        format.html { redirect_to @client_admin_work_property, notice: 'Work property was successfully updated.' }
        format.json { render :show, status: :ok, location: @client_admin_work_property }
      else
        format.html { render :edit }
        format.json { render json: @client_admin_work_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_admin/work_properties/1
  # DELETE /client_admin/work_properties/1.json
  def destroy
    @client_admin_work_property.destroy
    respond_to do |format|
      format.html { redirect_to client_admin_work_properties_url, notice: 'Work property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_admin_work_property
      @client_admin_work_property = ClientAdmin::WorkProperty.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_admin_work_property_params
      params.fetch(:client_admin_work_property, {})
    end
end
