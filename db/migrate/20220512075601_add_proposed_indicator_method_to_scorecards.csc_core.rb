# frozen_string_literal: true
# This migration comes from csc_core (originally 20220512074614)

class AddProposedIndicatorMethodToScorecards < ActiveRecord::Migration[6.1]
  def change
    add_column :scorecards, :proposed_indicator_method, :integer, default: 1
  end
end
