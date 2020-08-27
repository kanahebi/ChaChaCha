class DailyReportsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :edit, :update]
  before_action :set_daily_report, only: [:show, :edit, :update, :destroy]

  # GET /daily_reports
  # GET /daily_reports.json
  def index
    @daily_reports = DailyReport.all
  end

  # GET /daily_reports/1
  # GET /daily_reports/1.json
  def show
  end

  # GET /daily_reports/new
  def new
    authorize DailyReport

    @daily_report = DailyReport.new(date: Time.current)
  end

  # GET /daily_reports/1/edit
  def edit
    authorize @daily_report
  end

  # POST /daily_reports
  # POST /daily_reports.json
  def create
    authorize DailyReport

    @daily_report = current_user.daily_reports.build(daily_report_params)

    works_params[:works].each do |work_param|
      work = @daily_report.works.build(work_param)
      work.start_at.change(
        hour: work_param[:start_at].split(":").first,
        min: work_param[:start_at].split(":").last
      )
      work.end_at.change(
        hour: work_param[:end_at].split(":").first,
        min: work_param[:end_at].split(":").last
      )
    end
    @daily_report.build_arigatona(arigatona_params[:arigatona])

    if @daily_report.save
      redirect_to root_url, notice: 'Daily report was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /daily_reports/1
  # PATCH/PUT /daily_reports/1.json
  def update
    respond_to do |format|
      if @daily_report.update(daily_report_params)
        format.html { redirect_to @daily_report, notice: 'Daily report was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily_report }
      else
        format.html { render :edit }
        format.json { render json: @daily_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_reports/1
  # DELETE /daily_reports/1.json
  def destroy
    @daily_report.destroy
    respond_to do |format|
      format.html { redirect_to daily_reports_url, notice: 'Daily report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_daily_report
    @daily_report = DailyReport.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def daily_report_params
    params.require(:daily_report).permit(
      :date,
      :memo
    )
  end

  def works_params
    params.permit(
      works: [
        :work_content_id,
        :work_property_id,
        :start_at,
        :end_at,
        :include_rest
      ]
    )
  end

  def arigatona_params
    params.require(:arigatona).permit(
      :user_id,
      :comment
    )
  end
end
