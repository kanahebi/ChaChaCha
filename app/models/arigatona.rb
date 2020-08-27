# frozen_string_literal: true

class Arigatona < ApplicationRecord
  belongs_to :daily_report
  belongs_to :user

  validates :comment, presence: true

  def as_json_for_form
    as_json.merge(
      user: user.as_json.merge(
        department: user.department.as_json
      )
    )
  end
end
