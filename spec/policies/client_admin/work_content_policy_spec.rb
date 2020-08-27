# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClientAdmin::WorkContentPolicy, type: :policy do
  subject { described_class }

  let!(:system_admin) { build :user, :system_admin }
  let!(:client_admin) { build :user, :client_admin }
  let!(:client_general) { build :user, :client_general }

  permissions :index?, :create?, :update?, :destroy? do
    it "system_admin" do
      expect(subject).to permit(system_admin)
    end

    it "client_admin" do
      expect(subject).to permit(client_admin)
    end

    it "client_general" do
      expect(subject).not_to permit(client_general)
    end
  end
end
