# frozen_string_literal: true

class ClientAdmin::DailyReportUsersController < ApplicationController
  before_action :set_user, only: [:new, :create, :show]

  def index
    authorize [:client_admin, :user]

    @users = policy_scope([:client_admin, User])
  end

  def new
    authorize [:client_admin, :user]

    @daily_report = DailyReport.new(date: Time.current)
  end

  def create
    authorize [:client_admin, :user]

    @daily_report = @user.daily_reports.build(daily_report_params)

    assign_works!(@daily_report)
    assign_arigatona(@daily_report)

    if @daily_report.save
      redirect_to client_admin_daily_report_user_path(@user), notice: 'Daily report was successfully created.'
    else
      render :new
    end
  end

  def show
    authorize [:client_admin, :user]

    @daily_reports = @user.daily_reports
  end

  private

  def set_user
    @user = policy_scope([:client_admin, User]).find(params[:id])
  end

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
    elsif params.dig(:arigatona, :user_id) != '0'
      daily_report.build_arigatona(arigatona_params)
    end
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
    params.fetch(:arigatona).permit(
      :user_id,
      :comment
    )
  end
end
