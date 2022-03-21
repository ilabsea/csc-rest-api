# frozen_string_literal: true
# This migration comes from csc_core (originally 20210326043849)

class CreateCscCoreNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string   :provider
      t.text     :emails, array: true, default: []
      t.integer  :message_id
      t.integer  :program_id

      t.timestamps
    end
  end
end
