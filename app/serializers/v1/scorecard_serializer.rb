# frozen_string_literal: true

module V1
  class ScorecardSerializer < ActiveModel::Serializer
    attributes :uuid, :unit_type_name, :facility_id, :scorecard_type,
               :name, :description, :location, :year, :conducted_date,
               :number_of_caf, :number_of_participant, :number_of_female,
               :number_of_disability, :number_of_ethnic_minority, :number_of_youth, :number_of_id_poor,
               :planned_start_date, :planned_end_date, :status,
               :program_id, :local_ngo_id, :local_ngo_name, :province, :district, :commune, :progress

    belongs_to :facility
    belongs_to :primary_school

    def unit_type_name
      object.unit_type.name
    end

    def local_ngo_name
      object.local_ngo.try(:name)
    end
  end
end
