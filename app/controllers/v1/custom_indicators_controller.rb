# frozen_string_literal: true

module V1
  class CustomIndicatorsController < BaseController
    before_action :assign_params
    before_action :assign_scorecard

    def create
      authorize @scorecard, :submit?

      custom_indicator = CscCore::Indicators::CustomIndicator.find_or_initialize_by(uuid: indicator_params[:uuid])

      if custom_indicator.update(indicator_params)
        render json: custom_indicator, status: :created
      else
        render json: { error: custom_indicator.errors }, status: :unprocessable_entity
      end
    end

    private
      def assign_params
        params["custom_indicator"] = JSON.parse(params["custom_indicator"])
      end

      def assign_scorecard
        @scorecard = CscCore::Scorecard.find_by(uuid: params[:scorecard_id])

        raise ActiveRecord::RecordNotFound, with: :render_record_not_found if @scorecard.nil?
      end

      def indicator_params
        params.require(:custom_indicator).permit(:uuid, :name, tag_attributes: [:id, :name])
              .merge(
                audio: params[:audio],
                categorizable_id: @scorecard.facility_id,
                categorizable_type: @scorecard.facility.class.name
              )
      end
  end
end
