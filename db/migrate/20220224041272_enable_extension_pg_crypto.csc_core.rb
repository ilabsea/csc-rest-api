# This migration comes from csc_core (originally 20210820074111)
class EnableExtensionPgCrypto < ActiveRecord::Migration[6.1]
  def change
    enable_extension "pgcrypto"
  end
end
