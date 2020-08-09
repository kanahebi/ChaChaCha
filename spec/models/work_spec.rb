# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Work, type: :model do
  describe 'start_should_be_before_end' do
    before { work.valid? }

    context 'when valid' do
      let(:work) { build :work, start_at: 2.hours.ago, end_at: 1.hour.ago }

      it { expect(work.errors.messages[:base]).not_to include(I18n.t('errors.messages.start_should_be_before_end')) }
    end

    context 'when invalid' do
      let(:work) { build :work, start_at: 1.hours.ago, end_at: 2.hour.ago }

      it { expect(work.errors.messages[:base]).to include(I18n.t('errors.messages.start_should_be_before_end')) }
    end
  end

  describe 'work_time_must_not_over_lap' do
    let!(:current_time) { Time.current }
    let(:work) { build :work, start_at: current_time.ago(3.hours), end_at: current_time.ago(1.hours) }

    before do
      create :work, daily_report: work.daily_report, start_at: start_at, end_at: end_at
      work.valid?
    end

    context 'when valid' do
      context 'when 今回追加するレコードと既存レコードの作業時間が被らない場合' do
        let(:start_at) { current_time.ago(6.hours) }
        let(:end_at) { current_time.ago(4.hours) }

        it { expect(work.errors.messages[:base]).not_to include(I18n.t('errors.messages.work_time_must_not_over_lap')) }
      end

      context 'when 今回追加するレコードの開始時刻が既存レコードの終了時刻と同一の場合' do
        let(:start_at) { current_time.ago(5.hours) }
        let(:end_at) { current_time.ago(3.hours) }

        it { expect(work.errors.messages[:base]).not_to include(I18n.t('errors.messages.work_time_must_not_over_lap')) }
      end

      context 'when 今回追加するレコードの終了時刻が既存レコードの開始時刻と同一の場合' do
        let(:start_at) { current_time.ago(1.hours) }
        let(:end_at) { current_time }

        it { expect(work.errors.messages[:base]).not_to include(I18n.t('errors.messages.work_time_must_not_over_lap')) }
      end
    end

    context 'when invalid' do
      context 'when 今回追加するレコードの開始時刻が既存レコードの作業時刻内にある場合' do
        let(:start_at) { current_time.ago(4.hours) }
        let(:end_at) { current_time.ago(2.hours) }

        it { expect(work.errors.messages[:base]).to include(I18n.t('errors.messages.work_time_must_not_over_lap')) }
      end

      context 'when 今回追加するレコードの終了時刻が既存レコードの作業時刻内にある場合' do
        let(:start_at) { current_time.ago(2.hours) }
        let(:end_at) { current_time }

        it { expect(work.errors.messages[:base]).to include(I18n.t('errors.messages.work_time_must_not_over_lap')) }
      end
    end
  end
end
