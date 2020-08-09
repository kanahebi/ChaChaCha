# frozen_string_literal: true

class WorkProperty < ApplicationRecord
  belongs_to :client
  # has_many :work_property_relations, dependent: :restrict_with_exception

  validates :name, presence: true
end
