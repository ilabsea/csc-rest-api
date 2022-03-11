# frozen_string_literal: true

# == Schema Information
#
# Table name: contacts
#
#  id           :bigint           not null, primary key
#  contact_type :integer
#  value        :string
#  program_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
module V1
  class ContactSerializer < ActiveModel::Serializer
    attributes :id, :contact_type, :value, :program_id
  end
end
