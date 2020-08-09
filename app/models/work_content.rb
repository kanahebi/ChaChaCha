# frozen_string_literal: true

class WorkContent < ApplicationRecord
  belongs_to :client
  # has_many :work_content_relations, dependent: :restrict_with_exception

  validates :name, presence: true
end
