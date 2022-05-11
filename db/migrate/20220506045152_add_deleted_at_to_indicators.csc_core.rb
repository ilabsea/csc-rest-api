# frozen_string_literal: true
# This migration comes from csc_core (originally 20220428034914)

class AddDeletedAtToIndicators < ActiveRecord::Migration[6.1]
  def change
    add_column :indicators, :deleted_at, :datetime
    add_index :indicators, :deleted_at
  end
end
