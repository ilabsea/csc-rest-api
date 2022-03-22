# frozen_string_literal: true
# This migration comes from csc_core (originally 20220302040745)

class AddUuidToPrograms < ActiveRecord::Migration[6.1]
  def change
    add_column :programs, :uuid, :uuid, default: "uuid_generate_v4()"
  end
end
