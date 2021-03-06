# frozen_string_literal: true

module V2
  class CafsController < BaseController
    def index
      local_ngo = authorize CscCore::LocalNgo.find(params[:local_ngo_id])

      render json: local_ngo.cafs.actives
    end
  end
end
