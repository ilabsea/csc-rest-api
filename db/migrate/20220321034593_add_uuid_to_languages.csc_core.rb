# frozen_string_literal: true
# This migration comes from csc_core (originally 20220315034000)

class AddUuidToLanguages < ActiveRecord::Migration[6.1]
  def change
    add_column :languages, :uuid, :uuid, default: "uuid_generate_v4()"
  end
end
