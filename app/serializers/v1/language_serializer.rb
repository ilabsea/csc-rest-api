# frozen_string_literal: true

module V1
  class LanguageSerializer < ActiveModel::Serializer
    attributes :id, :code, :name_en, :name_km
  end
end
