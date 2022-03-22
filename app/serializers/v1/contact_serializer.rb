# frozen_string_literal: true

module V1
  class ContactSerializer < ActiveModel::Serializer
    attributes :id, :contact_type, :value, :program_id
  end
end
