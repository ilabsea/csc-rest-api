# frozen_string_literal: true
# This migration comes from csc_core (originally 20220303095504)

class CreateCscCoreDatasets < ActiveRecord::Migration[6.1]
  def change
    create_table :datasets, id: :uuid do |t|
      t.string :code
      t.string :name_en
      t.string :name_km
      t.string :category_id
      t.string :province_id
      t.string :district_id
      t.string :commune_id

      t.timestamps
    end
  end
end
