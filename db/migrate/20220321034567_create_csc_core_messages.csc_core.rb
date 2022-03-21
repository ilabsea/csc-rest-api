# frozen_string_literal: true
# This migration comes from csc_core (originally 20210326043632)

class CreateCscCoreMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text    :content
      t.string  :milestone
      t.integer :program_id
      t.boolean :actived, default: true

      t.timestamps
    end
  end
end
