# frozen_string_literal: true
# This migration comes from csc_core (originally 20220304085423)

class AddCategoryIdToFacilities < ActiveRecord::Migration[6.1]
  def change
    add_column :facilities, :category_id, :string
  end
end
