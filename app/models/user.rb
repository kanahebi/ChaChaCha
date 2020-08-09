# frozen_string_literal: true

class User < ApplicationRecord
  belogs_to :client, optional: true # 影山さんはnull
  # belongs_to :department, optional: true # 影山さんはnull
  # has_many :daily_reports, dependent: :restrict_with_exception
  # has_many :arigatonas, dependent: :restrict_with_exception

  has_secure_password

  UNIQUE_NAME_REGEX = /\A[a-z0-9\-_]+\z/i.freeze
  validates :unique_name, presence: true,
                          format: { with: UNIQUE_NAME_REGEX },
                          uniqueness: true
  validates :name, presence: true
  validates :password, confirmation: true, length: { minimum: 8 }, if: -> { new_record? || changes[:password_digest] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:password_digest] }

  enum role: { system_admin: 10, client_admin: 20, client_general: 30 }
end
