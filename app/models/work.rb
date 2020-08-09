# frozen_string_literal: true

class Work < ApplicationRecord
  belongs_to :daily_report
  belongs_to :work_content
  belongs_to :work_property

  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :start_should_be_before_end
  validate :work_time_must_not_over_lap

  private

  def start_should_be_before_end
    errors.add(:base, '開始時刻は終了時刻より前にしてください') if start_at > end_at
  end

  def work_time_must_not_over_lap
    # 今回追加するレコードの開始時刻が既存レコードの作業時刻内にある場合
    if daily_report.works.where('start_at < ?', start_at).where('end_at > ?', start_at).exists? ||
    # 今回追加するレコードの終了時刻が既存レコードの作業時刻内にある場合
       daily_report.works.where('start_at < ?', end_at).where('end_at > ?', end_at).exists?
       errors.add(:base, '作業時刻が重複しています')
    end
  end
end
