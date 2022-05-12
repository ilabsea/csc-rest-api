# frozen_string_literal: true
# This migration comes from csc_core (originally 20220506075047)

class AddShortcutToScorecardKnowledges < ActiveRecord::Migration[6.1]
  def change
    add_column :scorecard_knowledges, :shortcut_name_en, :string
    add_column :scorecard_knowledges, :shortcut_name_km, :string
  end
end
