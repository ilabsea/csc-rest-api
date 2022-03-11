# frozen_string_literal: true
# This migration comes from csc_core (originally 20210629101346)

class CreateCscCoreMobileTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :mobile_tokens do |t|
      t.string   :token
      t.integer  :program_id

      t.timestamps
    end
  end
end
