# This migration comes from csc_core (originally 20210922022513)
class CreateCscCoreGfDashboards < ActiveRecord::Migration[6.1]
  def change
    create_table :gf_dashboards, id: :uuid do |t|
      t.integer :dashboard_id
      t.string  :dashboard_uid
      t.string  :dashboard_url
      t.integer :org_id
      t.string  :org_token
      t.integer :program_id

      t.timestamps
    end
  end
end
