# frozen_string_literal: true

module V1
  class RatingScalesController < BaseController
    def index
      authorize CscCore::RatingScale, :index?
      program = CscCore::Program.find(params[:program_id])

      render json: program.rating_scales, each_serializer: serializer_klass
    end
  end
end
