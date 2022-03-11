# frozen_string_literal: true
# This migration comes from csc_core (originally 20200903042410)

class EnableExtensionPgCrypto < ActiveRecord::Migration[6.1]
  def change
    enable_extension "pgcrypto"
    enable_extension "uuid-ossp"
  end
end
