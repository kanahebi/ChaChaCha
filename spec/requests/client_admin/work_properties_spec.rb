# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "/client_admin/work_properties", type: :request do
  before { login(user) }

  let!(:user) { create(:user, :client_admin) }
  let!(:work_property) { create :work_property, client_id: user.client_id }

  describe 'index' do
    it '200' do
      get client_admin_work_properties_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'new' do
    it '200' do
      get new_client_admin_work_property_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'edit' do
    it '200' do
      get edit_client_admin_work_property_path(work_property)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create' do
    it '302' do
      post client_admin_work_properties_path, params: {
        work_property: {
          client_id: user.client_id,
          name: 'テスト',
          code: 'XXX-001',
          active: true,
        },
      }
      expect(response).to have_http_status(:found)
    end
  end

  describe 'update' do
    it '302' do
      patch client_admin_work_property_path(work_property), params: {
        work_property: {
          name: 'ニューーーー',
        },
      }
      expect(response).to have_http_status(:found)
    end
  end

  describe 'destroy' do
    it '302' do
      delete client_admin_work_property_path(work_property)
      expect(response).to have_http_status(:found)
    end
  end
end
