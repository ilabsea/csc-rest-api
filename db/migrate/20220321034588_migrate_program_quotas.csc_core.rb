# frozen_string_literal: true
# This migration comes from csc_core (originally 20220303090040)

class MigrateProgramQuotas < ActiveRecord::Migration[6.1]
  def up
    Rake::Task["csc_core_program:migrate_program_quota"].invoke
  end

  def down
    CscCore::Quota.delete_all
  end
end
