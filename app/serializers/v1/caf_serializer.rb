# frozen_string_literal: true

module V1
  class CafSerializer < ActiveModel::Serializer
    attributes :id, :name, :sex, :date_of_birth, :tel, :address, :local_ngo_id,
               :educational_background

    has_many :scorecard_knowledges

    def educational_background
      object.educational_background_name
    end
  end
end
