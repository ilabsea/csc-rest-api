# frozen_string_literal: true
# This migration comes from csc_core (originally 20201019074019)

class CreateCscCoreCustomIndicators < ActiveRecord::Migration[6.1]
  def change
    create_table :custom_indicators do |t|
      t.string  :name
      t.string  :audio
      t.string  :scorecard_uuid
      t.integer :tag_id
      t.string  :uuid

      t.timestamps
    end
  end
end
