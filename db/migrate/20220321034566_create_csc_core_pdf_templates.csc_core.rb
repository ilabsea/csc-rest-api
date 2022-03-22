# frozen_string_literal: true
# This migration comes from csc_core (originally 20210323065059)

class CreateCscCorePdfTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :pdf_templates do |t|
      t.string  :name
      t.text    :content
      t.string  :language_code
      t.integer :program_id

      t.timestamps
    end
  end
end
