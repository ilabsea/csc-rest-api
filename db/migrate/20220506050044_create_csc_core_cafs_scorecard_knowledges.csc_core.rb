# frozen_string_literal: true
# This migration comes from csc_core (originally 20220503021709)

class CreateCscCoreCafsScorecardKnowledges < ActiveRecord::Migration[6.1]
  def change
    create_table :cafs_scorecard_knowledges do |t|
      t.integer :caf_id
      t.uuid    :scorecard_knowledge_id

      t.timestamps
    end
  end
end
