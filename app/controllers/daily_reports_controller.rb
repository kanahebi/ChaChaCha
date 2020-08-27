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

    assign_works!(@daily_report)
    assign_arigatona(@daily_report)

    if @daily_report.save
      redirect_to root_url, notice: 'Daily report was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /daily_reports/1
  # PATCH/PUT /daily_reports/1.json
  def update
    authorize @daily_report

    # assign_works!がSave前に削除を実行するのでTransactionで囲んで戻れるようにする
    ApplicationRecord.transaction do
      assign_works!(@daily_report)
      assign_arigatona(@daily_report)

      if @daily_report.update!(daily_report_params)
        redirect_to edit_daily_report_path(@daily_report), notice: 'Daily report was successfully updated.'
      else
        render :edit
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

  # パラメタに渡されたworksの情報をdaily_reportに設定する
  # 保存済みでパラメタに存在しないworkはこのタイミングでdeleteが発行される
  def assign_works!(daily_report)
    # 保存済みの場合はパラメタに存在しないレコードを削除する
    if daily_report.persisted?
      parameter_work_ids = works_params[:works].map { |work| work[:id] }
      daily_report.works.each do |work|
        next if parameter_work_ids.include?(work.id.to_s)

        work.destroy
      end
    end

    works_params[:works].each do |work_param|
      work_param_id = work_param[:id]
      if work_param_id.present?
        daily_report.works.detect { |work| work.id.to_s == work_param_id }.assign_attributes(work_param)
      else
        daily_report.works.build(work_param)
      end
    end
  end

  def assign_arigatona(daily_report)
    if daily_report.arigatona
      daily_report.arigatona.assign_attributes(arigatona_params)
    else
      arigatona.build_arigatona(arigatona_params)
    end
  end

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
        :id,
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
