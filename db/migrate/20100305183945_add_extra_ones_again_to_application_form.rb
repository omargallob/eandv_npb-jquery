class AddExtraOnesAgainToApplicationForm < ActiveRecord::Migration
  def self.up
    add_column :application_forms, :lang_spa_fluent, :bool
    add_column :application_forms, :lang_spa_good, :bool
    add_column :application_forms, :lang_ger_good, :bool
  end

  def self.down
    remove_column :application_forms, :lang_ger_good
    remove_column :application_forms, :lang_spa_good
    remove_column :application_forms, :lang_spa_fluent
  end
end
