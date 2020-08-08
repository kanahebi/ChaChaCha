# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/roots', type: :request do
  describe 'index' do
    before { login(create(:user)) }

    it '200' do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end
end
