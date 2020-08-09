# frozen_string_literal: true

class WorkContent < ApplicationRecord
  belongs_to :client

  validates :name, presence: true
end
