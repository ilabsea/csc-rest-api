# This migration comes from csc_core (originally 20201013095448)
class CreateCscCoreTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :templates do |t|
      t.string "name"
      t.integer "program_id"

      t.timestamps
    end
  end
end
