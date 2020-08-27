# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "/client_admin/work_contents", type: :request do
  let!(:work_content) { create :work_content }

  describe 'index' do
    before { login(create(:user, :client_admin)) }

    it '200' do
      get client_admin_work_contents_path
      expect(response).to have_http_status(:ok)
    end
  end

  xdescribe 'new' do
    it '200' do
      get new_client_admin_work_content_path
      expect(response).to have_http_status(:ok)
    end
  end

  xdescribe 'edit' do
    it '200' do
      get edit_client_admin_work_content_path(work_content)
      expect(response).to have_http_status(:ok)
    end
  end

  xdescribe 'create' do
    it '302' do
      post client_admin_work_contents_path, params: {
        work_content: {
          name: 'テスト',
        },
      }
      expect(response).to have_http_status(:found)
    end
  end

  xdescribe 'update' do
    it '302' do
      patch client_admin_work_content_path(work_content), params: {
        work_content: {
          name: 'ニューーーー',
        },
      }
      expect(response).to have_http_status(:found)
    end
  end

  xdescribe 'destroy' do
    it '302' do
      delete client_admin_work_content_path(work_content)
      expect(response).to have_http_status(:found)
    end
  end
end
