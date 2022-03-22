# frozen_string_literal: true
# This migration comes from csc_core (originally 20210820074707)

class CreateCscCoreEducationalBackgrounds < ActiveRecord::Migration[6.1]
  def change
    create_table :educational_backgrounds do |t|
      t.string :code
      t.string :name_en
      t.string :name_km

      t.timestamps
    end
  end
end
