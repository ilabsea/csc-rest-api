# frozen_string_literal: true

require "rails_helper"

RSpec.describe V2::LanguagesController, type: :request do
  describe "GET #index" do
    let!(:user) { create(:user) }
    let!(:program) { create(:program) }
    let(:json_response) { JSON.parse(response.body) }

    before {
      headers = { "ACCEPT" => "application/json", "Authorization" => "Token #{user.authentication_token}" }
      get "/api/v2/programs/#{program.id}/languages", headers: headers
    }

    it { expect(response.content_type).to eq("application/json; charset=utf-8") }
    it { expect(response.status).to eq(200) }
    it { expect(json_response.length).to eq(1) }
  end
end
