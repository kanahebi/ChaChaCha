# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "/client_admin/users", type: :request do
  before { login(user) }

  let!(:user) { create(:user, :client_admin) }

  describe 'index' do
    it '200' do
      get client_admin_users_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'new' do
    it '200' do
      get new_client_admin_user_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'edit' do
    it '200' do
      get edit_client_admin_user_path(user)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create' do
    let!(:department) { create :department, client_id: user.client_id }

    it '302' do
      post client_admin_users_path, params: {
        user: {
          client_id: user.client_id,
          department_id: department.id,
          unique_name: 'test',
          name: 'テスト',
          password: 'password',
          password_confirmation: 'password',
          role: :client_general,
        },
      }
      expect(response).to have_http_status(:found)
    end
  end

  describe 'update' do
    it '302' do
      patch client_admin_user_path(user), params: {
        user: {
          name: 'ニューーーー',
        },
      }
      expect(response).to have_http_status(:found)
    end
  end

  describe 'destroy' do
    it '302' do
      delete client_admin_user_path(user)
      expect(response).to have_http_status(:found)
    end
  end
end
