# frozen_string_literal: true

class Session
  include ActiveModel::Model

  attr_accessor :unique_name, :password

  validate :valid_user?

  def user
    User.find_by(unique_name: unique_name)
  end

  private

  def valid_user?
    errors[:base] << 'ユーザー名かパスワードに誤りがあります。' if user.blank? || !user.authenticate(password)
  end
end
