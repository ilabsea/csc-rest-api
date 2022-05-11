# frozen_string_literal: true
# This migration comes from csc_core (originally 20220428045241)

class AddDeletedAtToLanguages < ActiveRecord::Migration[6.1]
  def change
    add_column :languages, :deleted_at, :datetime
    add_index :languages, :deleted_at
  end
end
