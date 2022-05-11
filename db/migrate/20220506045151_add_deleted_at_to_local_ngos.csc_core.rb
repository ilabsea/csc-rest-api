# frozen_string_literal: true
# This migration comes from csc_core (originally 20220428023219)

class AddDeletedAtToLocalNgos < ActiveRecord::Migration[6.1]
  def change
    add_column :local_ngos, :deleted_at, :datetime
    add_index :local_ngos, :deleted_at
  end
end
