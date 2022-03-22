# frozen_string_literal: true
# This migration comes from csc_core (originally 20210326062749)

class CreateCscCoreChatGroupsNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_groups_notifications do |t|
      t.integer  :chat_group_id
      t.integer  :notification_id

      t.timestamps
    end
  end
end
