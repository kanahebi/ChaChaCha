# frozen_string_literal: true

class Work < ApplicationRecord
  belongs_to :daily_report
  belongs_to :work_content
  belongs_to :work_property

  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :start_should_be_before_end
  validate :work_time_must_not_over_lap

  def as_json_for_form
    as_json.merge(
      start_at: "#{start_at.hour}:#{start_at.min.to_s.rjust(2, "0")}",
      end_at: "#{end_at.hour}:#{end_at.min.to_s.rjust(2, "0")}",
      work_content: work_content.as_json,
      work_property: work_property.as_json
    )
  end

  private

  def start_should_be_before_end
    errors.add(:base, I18n.t('errors.messages.start_should_be_before_end')) if start_at > end_at
  end

  def work_time_must_not_over_lap
    # 今回追加するレコードの開始時刻が既存レコードの作業時刻内にある場合(ex. 既存: 1:00-3:00, 新規: 2:00-4:00)
    if daily_report.works.where('start_at <= ?', start_at).where('end_at > ?', start_at).exists? ||
    # 今回追加するレコードの終了時刻が既存レコードの作業時刻内にある場合(ex. 既存: 1:00-3:00, 新規: 0:00-2:00)
       daily_report.works.where('start_at < ?', end_at).where('end_at >= ?', end_at).exists?
       errors.add(:base, I18n.t('errors.messages.work_time_must_not_over_lap'))
    end
  end
end
