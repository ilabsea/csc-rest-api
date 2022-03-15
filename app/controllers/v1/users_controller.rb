# frozen_string_literal: true

module V1
  class UsersController < BaseController
    def lock_access
      current_user.lock_access

      head :ok
    end
  end
end
