# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/system_admin/clients', type: :request do
  let!(:client) { create :client }

  describe 'index' do
    before { login(create(:user, :system_admin)) }

    it '200' do
      get system_admin_clients_path
      expect(response).to have_http_status(:ok)
    end
  end

  xdescribe 'new' do
    it '200' do
      get new_system_admin_client_path
      expect(response).to have_http_status(:ok)
    end
  end

  xdescribe 'edit' do
    it '200' do
      get edit_system_admin_client_path(client)
      expect(response).to have_http_status(:ok)
    end
  end

  xdescribe 'create' do
    it '302' do
      post system_admin_clients_path, params: {
        client: {
          name: 'テスト',
        },
      }
      expect(response).to have_http_status(:found)
    end
  end

  xdescribe 'update' do
    it '302' do
      patch system_admin_client_path(client), params: {
        client: {
          name: 'ニューーーー',
        },
      }
      expect(response).to have_http_status(:found)
    end
  end

  xdescribe 'destroy' do
    it '302' do
      delete system_admin_client_path(client)
      expect(response).to have_http_status(:found)
    end
  end
end
