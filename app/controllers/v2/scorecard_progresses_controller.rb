# frozen_string_literal: true

module V2
  class ScorecardProgressesController < BaseController
    before_action :assign_scorecard

    def create
      authorize @scorecard, :submit?
      @scorecard_progress = @scorecard.scorecard_progresses.new(scorecard_progress_params)

      if @scorecard_progress.save
        head :ok
      else
        render json: { errors: @scorecard_progress.errors }, status: :unprocessable_entity
      end
    end

    private
      def assign_scorecard
        @scorecard = CscCore::Scorecard.find_by(uuid: scorecard_progress_params[:scorecard_uuid])

        raise ActiveRecord::RecordNotFound, with: :render_record_not_found if @scorecard.nil?
      end

      def scorecard_progress_params
        params.require(:scorecard_progress).permit(
          :scorecard_uuid, :status, :device_id
        ).merge(user_id: current_user.id)
      end
  end
end
