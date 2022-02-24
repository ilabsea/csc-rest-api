# frozen_string_literal: true

module V1
  class ContactsController < BaseController
    skip_before_action :restrict_access, only: :system_contacts

    def index
      render json: current_user.program.contacts
    end

    def system_contacts
      render json: CscCore::Contact.system_contacts
    end
  end
end
