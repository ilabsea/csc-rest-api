# frozen_string_literal: true

module V1
  class IndicatorsController < BaseController
    def index
      authorize CscCore::Indicator, :index?
      facility = Facility.find(params[:facility_id])

      render json: facility.indicators.predefines, each_serializer: serializer_klass
    end
  end
end
