# frozen_string_literal: true

class Client < ApplicationRecord
  has_many :users, dependent: :restrict_with_exception
  has_many :departments, dependent: :restrict_with_exception
  has_many :work_contents, dependent: :restrict_with_exception
  has_many :work_properties, dependent: :restrict_with_exception

  validates :name, presence: true
end
