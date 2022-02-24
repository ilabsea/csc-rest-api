# This migration comes from csc_core (originally 20201211063205)
class CreateCscCoreLanguageRatingScales < ActiveRecord::Migration[6.1]
  def change
    create_table :language_rating_scales do |t|
      t.integer :rating_scale_id
      t.integer :language_id
      t.string  :language_code
      t.string  :audio
      t.string  :content

      t.timestamps
    end
  end
end
