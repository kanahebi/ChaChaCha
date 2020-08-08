# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :password, confirmation: true, length: { minimum: 8 }, if: -> { new_record? || changes[:password_digest] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:password_digest] }

  enum role: { system_admin: 10, client_admin: 20, client_general: 30 }
end
