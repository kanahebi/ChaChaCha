  # frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/system_admin/roots', type: :request do
  describe 'index' do
    before { login(create(:user, :system_admin)) }

    it '200' do
      get system_admin_root_path
      expect(response).to have_http_status(:ok)
    end
  end
end
