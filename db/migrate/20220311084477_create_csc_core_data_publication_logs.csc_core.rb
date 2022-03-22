# frozen_string_literal: true
# This migration comes from csc_core (originally 20211125035231)

class CreateCscCoreDataPublicationLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :data_publication_logs, id: :uuid do |t|
      t.integer  :program_id
      t.integer  :published_option

      t.timestamps
    end
  end
end
