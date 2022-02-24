# This migration comes from csc_core (originally 20210617070515)
class CreateCscCoreScorecardReferences < ActiveRecord::Migration[6.1]
  def change
    create_table :scorecard_references do |t|
      t.string :uuid
      t.string :scorecard_uuid
      t.string :attachment
      t.string :kind

      t.timestamps
    end
  end
end
