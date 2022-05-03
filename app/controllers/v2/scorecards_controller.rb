# frozen_string_literal: true

# This version can be used when device is no longer installed mobile app 1.4.4

module V2
  class ScorecardsController < BaseController
    before_action :assign_scorecard

    def show
      respond_to do |format|
        format.json do
          authorize @scorecard, :download?

          render json: @scorecard
        end

        format.pdf do
          authorize @scorecard, :download_pdf?

          pdf_html = ActionController::Base.new.render_to_string(inline: CscCore::PdfTemplateInterpreter.new(@scorecard.uuid).interpreted_message, layout: "pdf")
          pdf = WickedPdf.new.pdf_from_string(pdf_html)

          send_data pdf, filename: "scorecard_#{@scorecard.uuid}.pdf"
        end
      end
    end

    def update
      authorize @scorecard, :submit?

      if @scorecard.update(scorecard_params)
        @scorecard.lock_submit!
        render json: @scorecard, status: :ok
      else
        render json: { errors: @scorecard.errors }, status: :unprocessable_entity
      end
    end

    private
      def assign_scorecard
        @scorecard = CscCore::Scorecard.find_by(uuid: params[:id])

        raise ActiveRecord::RecordNotFound, with: :render_record_not_found if @scorecard.nil?
      end

      def scorecard_params
        params.require(:scorecard).permit(
          :conducted_date, :number_of_caf, :number_of_participant, :number_of_female,
          :number_of_disability, :number_of_ethnic_minority, :number_of_youth, :number_of_id_poor,
          :finished_date, :language_conducted_code, :running_date, :device_type, :device_token,
          facilitators_attributes: [ :id, :caf_id, :position, :scorecard_uuid ],
          participants_attributes: [ :uuid, :age, :gender, :scorecard_uuid, profile_ids: [] ],
          raised_indicators_attributes: [
            :indicator_uuid, :participant_uuid, :selected, :voting_indicator_uuid, :scorecard_uuid, tag_attributes: [:name]
          ],
          voting_indicators_attributes: [
            :uuid, :indicator_uuid, :participant_uuid,
            :median, :scorecard_uuid, :display_order,
            indicator_activities_attributes: [ :uuid, :voting_indicator_uuid, :scorecard_uuid, :content, :selected, :type ]
          ],
          ratings_attributes: [ :uuid, :voting_indicator_uuid, :participant_uuid, :scorecard_uuid, :score ]
        )
      end
  end
end
