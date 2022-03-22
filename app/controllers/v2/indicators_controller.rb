# frozen_string_literal: true

module V2
  class IndicatorsController < BaseController
    def index
      authorize CscCore::Indicator, :index?
      facility = CscCore::Facility.find(params[:facility_id])

      render json: facility.indicators.predefines
    end
  end
end
