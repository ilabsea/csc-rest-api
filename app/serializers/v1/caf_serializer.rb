# frozen_string_literal: true

module V1
  class CafSerializer < ActiveModel::Serializer
    attributes :id, :name, :sex, :date_of_birth, :tel, :address, :local_ngo_id,
               :educational_background, :scorecard_knowledge

    def educational_background
      object.educational_background_name
    end

    def scorecard_knowledge
      object.scorecard_knowledge_name
    end
  end
end
