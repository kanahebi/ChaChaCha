# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'over_users_limit?' do
    let(:client) { create :client, users_limit: users_limit}
    let(:user) { build :user, client: client}

    before do
      create :user, client: client
      user.valid?
    end

    context 'when valid' do
      let(:users_limit) { 2 }

      it { expect(user.errors.messages[:base]).not_to include(I18n.t('errors.messages.over_users_limit')) }
    end

    context 'when invalid' do
      let(:users_limit) { 1 }

      it { expect(user.errors.messages[:base]).to include(I18n.t('errors.messages.over_users_limit')) }
    end
  end
end
