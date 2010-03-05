class AddExtraOnesToApplicationForm < ActiveRecord::Migration
  def self.up
    add_column :application_forms, :lang_eng_fluent, :bool
    add_column :application_forms, :lang_eng_good, :bool
    add_column :application_forms, :lang_ger_fluent, :bool
  end

  def self.down
    remove_column :application_forms, :lang_ger_fluent
    remove_column :application_forms, :lang_eng_good
    remove_column :application_forms, :lang_eng_fluent
  end
end
