# frozen_string_literal: true

class WorkProperty < ApplicationRecord
  belongs_to :client

  validates :name, presence: true
end
