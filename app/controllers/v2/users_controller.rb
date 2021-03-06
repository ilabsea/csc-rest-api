# frozen_string_literal: true

module V2
  class UsersController < BaseController
    def lock_access
      current_user.lock_access!(send_instructions: false)

      head :ok
    end
  end
end
