# This migration comes from csc_core (originally 20211125035225)
class CreateCscCoreDataPublications < ActiveRecord::Migration[6.1]
  def change
    create_table :data_publications, id: :uuid do |t|
      t.integer  :program_id
      t.integer  :published_option

      t.timestamps
    end
  end
end
