# frozen_string_literal: true

class DailyReport < ApplicationRecord
  belongs_to :user
  has_many :works, dependent: :restrict_with_exception
  has_one :arigatona, dependent: :restrict_with_exception, autosave: true

  validates :date, presence: true, uniqueness: { scope: :user_id }
end
