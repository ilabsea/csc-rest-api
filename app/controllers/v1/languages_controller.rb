# frozen_string_literal: true

module V1
  class LanguagesController < BaseController
    def index
      authorize CscCore::Language, :index?
      program = CscCore::Program.find_by(id: params[:program_id])

      render json: program.languages, each_serializer: serializer_klass
    end
  end
end
