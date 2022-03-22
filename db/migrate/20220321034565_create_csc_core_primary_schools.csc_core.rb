# frozen_string_literal: true
# This migration comes from csc_core (originally 20210208104653)

class CreateCscCorePrimarySchools < ActiveRecord::Migration[6.1]
  def change
    create_table :primary_schools do |t|
      t.string :code
      t.string :name_en
      t.string :name_km
      t.string :commune_id
      t.string :district_id
      t.string :province_id

      t.timestamps
    end
  end
end
