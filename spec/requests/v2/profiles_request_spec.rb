# frozen_string_literal: true

require "rails_helper"

RSpec.describe V2::ContactsController, type: :request do
  describe "GET #index, profiles" do
    let!(:profiles) { CscCore::Profile.create_defaults }
    let!(:user) { create(:user) }
    let(:json_response) { JSON.parse(response.body) }

    before {
      headers = { "ACCEPT" => "application/json", "Authorization" => "Token #{user.authentication_token}" }
      get "/api/v2/profiles", headers: headers
    }

    it { expect(response.content_type).to eq("application/json; charset=utf-8") }
    it { expect(response.status).to eq(200) }
    it { expect(json_response.length).not_to eq(0) }
    it { expect(json_response.length).to eq(profiles.length) }
  end
end
