# frozen_string_literal: true

class Arigatona < ApplicationRecord
  belongs_to :daily_report
  belongs_to :user

  validates :comment, presence: true
end
