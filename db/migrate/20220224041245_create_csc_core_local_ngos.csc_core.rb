# This migration comes from csc_core (originally 20201012082550)
class CreateCscCoreLocalNgos < ActiveRecord::Migration[6.1]
  def change
    create_table :local_ngos do |t|
      t.string :code
      t.string :name
      t.string :province_id, limit: 2
      t.string :district_id, limit: 4
      t.string :commune_id, limit: 6
      t.string :village_id, limit: 8
      t.string :target_province_ids
      t.string :target_provinces
      t.string :website_url
      t.integer :program_id

      t.timestamps
    end
  end
end


