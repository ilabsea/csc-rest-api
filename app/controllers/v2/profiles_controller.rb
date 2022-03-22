# frozen_string_literal: true

module V2
  class ProfilesController < BaseController
    def index
      render json: CscCore::Profile.all
    end
  end
end
