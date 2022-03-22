# frozen_string_literal: true

module V1
  class IndicatorSerializer < ActiveModel::Serializer
    attributes :id, :name, :tag_id, :tag_name, :image

    belongs_to :categorizable
    has_many :languages_indicators

    def tag_name
      object.tag_name
    end

    def image
      object.image_url
    end

    class LanguagesIndicatorSerializer < ActiveModel::Serializer
      attributes :id, :language_code, :content, :audio, :version

      def audio
        object.audio_url
      end
    end
  end
end
