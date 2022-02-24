# This migration comes from csc_core (originally 20210629101242)
class CreateCscCoreMobileNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :mobile_notifications do |t|
      t.string  :title
      t.text    :body
      t.integer :success_count
      t.integer :failure_count
      t.integer :creator_id
      t.integer :program_id

      t.timestamps
    end
  end
end
