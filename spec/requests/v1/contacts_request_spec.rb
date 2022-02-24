# frozen_string_literal: true

require "rails_helper"

RSpec.describe V1::ContactsController, type: :request do
  describe "GET #index, program contact" do
    let!(:program) { create(:program) }
    let!(:user) { create(:user, program: program) }
    let!(:contact) { create(:contact, program_id: program.id) }
    let(:json_response) { JSON.parse(response.body) }

    before {
      headers = { "ACCEPT" => "application/json", "Authorization" => "Token #{user.authentication_token}" }
      get "/api/v1/contacts", headers: headers
    }

    it { expect(response.content_type).to eq("application/json; charset=utf-8") }
    it { expect(response.status).to eq(200) }
    it { expect(json_response.length).to eq(1) }
  end

  describe "#system contact" do
    context "with system email" do
      let!(:contact) { create(:contact, :no_program, :system_email) }

      it "responses system email as json" do
        get "/api/v1/contacts/system_contacts"

        expect(response.body).to include "email@system.com"
      end
    end

    context "with system tel" do
      let!(:contact) { create(:contact, :no_program, :system_tel) }

      it "responses system tel as json" do
        get "/api/v1/contacts/system_contacts"

        expect(response.body).to include "012333444"
      end
    end
  end
end
