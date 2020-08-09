# frozen_string_literal: true

class Department < ApplicationRecord
  belongs_to :client
  has_many :users, dependent: :restrict_with_exception

  validates :name, presence: true
end
