# frozen_string_literal: true

module V1
  class FacilitySerializer < ActiveModel::Serializer
    attributes :id, :code, :name_en, :name_km, :parent_id, :program_id
  end
end
