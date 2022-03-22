# frozen_string_literal: true
# This migration comes from csc_core (originally 20210326063832)

class CreateCscCoreTelegramBots < ActiveRecord::Migration[6.1]
  def change
    create_table :telegram_bots do |t|
      t.string  :token
      t.string  :username
      t.boolean :enabled, default: false
      t.boolean :actived, default: false
      t.integer :program_id

      t.timestamps
    end
  end
end
