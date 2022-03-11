# frozen_string_literal: true
# This migration comes from csc_core (originally 20210408043453)

class CreateCscCoreScorecardProgresses < ActiveRecord::Migration[6.1]
  def change
    create_table :scorecard_progresses do |t|
      t.string  :scorecard_uuid
      t.integer :status
      t.string  :device_id
      t.integer :user_id

      t.timestamps
    end
  end
end
