# frozen_string_literal: true
# This migration comes from csc_core (originally 20220318071927)

class CreateCscCoreProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles, id: :uuid do |t|
      t.string :code
      t.string :name_en
      t.string :name_km

      t.timestamps
    end
  end
end
