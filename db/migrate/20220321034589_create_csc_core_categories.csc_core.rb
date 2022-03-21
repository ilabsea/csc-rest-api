# frozen_string_literal: true
# This migration comes from csc_core (originally 20220303095211)

class CreateCscCoreCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :code
      t.string :name_en
      t.string :name_km
      t.string :hierarchy

      t.timestamps
    end
  end
end
