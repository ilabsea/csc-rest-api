# frozen_string_literal: true

module V1
  class CafsController < BaseController
    def index
      local_ngo = authorize CscCore::LocalNgo.find(params[:local_ngo_id])

      render json: local_ngo.cafs.actives, each_serializer: serializer_klass
    end
  end
end
