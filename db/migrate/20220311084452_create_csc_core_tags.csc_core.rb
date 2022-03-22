# frozen_string_literal: true
# This migration comes from csc_core (originally 20201110074832)

class CreateCscCoreTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
