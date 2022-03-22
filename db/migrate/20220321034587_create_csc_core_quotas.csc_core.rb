# frozen_string_literal: true
# This migration comes from csc_core (originally 20220302080324)

class CreateCscCoreQuotas < ActiveRecord::Migration[6.1]
  def change
    create_table :quotas, id: :uuid do |t|
      t.integer :program_id
      t.integer :quantity

      t.timestamps
    end
  end
end
