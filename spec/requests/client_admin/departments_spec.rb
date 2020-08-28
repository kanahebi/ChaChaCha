# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "/client_admin/departments", type: :request do
  before { login(user) }

  let!(:user) { create(:user, :client_admin) }
  let!(:department) { create :department, client_id: user.client_id }

  describe 'index' do
    it '200' do
      get client_admin_departments_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'new' do
    it '200' do
      get new_client_admin_department_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'edit' do
    it '200' do
      get edit_client_admin_department_path(department)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create' do
    it '302' do
      post client_admin_departments_path, params: {
        department: {
          client_id: user.client_id,
          name: '試験',
        },
      }
      expect(response).to have_http_status(:found)
    end
  end

  describe 'update' do
    it '302' do
      patch client_admin_department_path(department), params: {
        department: {
          name: 'ニューーーー',
        },
      }
      expect(response).to have_http_status(:found)
    end
  end

  describe 'destroy' do
    it '302' do
      delete client_admin_department_path(department)
      expect(response).to have_http_status(:found)
    end
  end
end
