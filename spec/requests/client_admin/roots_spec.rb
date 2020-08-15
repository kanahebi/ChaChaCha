  # frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/client_admin/roots', type: :request do
  describe 'index' do
    before { login(create(:user, :client_admin)) }

    it '200' do
      get client_admin_root_path
      expect(response).to have_http_status(:ok)
    end
  end
end
