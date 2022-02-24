# This migration comes from csc_core (originally 20201013023741)
class CreateCscCoreLanguagesIndicators < ActiveRecord::Migration[6.1]
  def change
    create_table :languages_indicators do |t|
      t.integer :language_id
      t.string  :language_code
      t.integer :indicator_id
      t.string  :content
      t.string  :audio
      t.integer :version, default: 0

      t.timestamps
    end
  end
end
