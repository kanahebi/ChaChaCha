# frozen_string_literal: true

class ClientAdmin::DailyReportsController < ApplicationController
  before_action :set_daily_report
  before_action :set_user

  def show
    authorize [:client_admin, @user]
  end

  def edit
    authorize [:client_admin, @user]
  end

  def update
    authorize [:client_admin, @user]

    if @daily_report.update(daily_report_params)
      redirect_to client_admin_daily_report_user_url(@user), notice: t("helpers.done.update")
    else
      render :edit
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
    elsif params.dig(:arigatona, :user_id) != '0'
      daily_report.build_arigatona(arigatona_params)
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_daily_report
    @daily_report = DailyReport.find(params[:id])
  end

  def set_user
    @user = @daily_report.user
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
