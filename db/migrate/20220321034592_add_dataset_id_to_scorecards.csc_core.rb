# frozen_string_literal: true
# This migration comes from csc_core (originally 20220304091539)

class AddDatasetIdToScorecards < ActiveRecord::Migration[6.1]
  def change
    add_column :scorecards, :dataset_code, :string
  end
end
