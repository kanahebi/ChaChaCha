# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "new" do
    it "200" do
      get signin_url
      expect(response).to have_http_status(:ok)
    end
  end

  describe "create" do
    let!(:user) { create :user }

    it "302" do
      post session_url, params: {
        session: {
          unique_name: user.unique_name,
          password: user.password,
        },
      }
      expect(response).to have_http_status(:found)
    end
  end

  describe "destroy" do
    before { login(create(:user)) }

    it "302" do
      delete session_url
      expect(response).to have_http_status(:found)
    end
  end
end
