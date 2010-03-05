class CreateApplicationForms < ActiveRecord::Migration
  def self.up
    create_table :application_forms do |t|
      t.integer :job_id
      t.string :salutation
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :add_street
      t.string :add_city
      t.string :telephone
      t.bool :contact
      t.string :email
      t.string :current_position
      t.string :desired_income
      t.bool :re_know_how
      t.string :qualifications
      t.string :education
      t.string :university
      t.text :other
      t.text :it_skills
      t.bool :lang_eng_fluent
      t.bool :lang_eng_good
      t.bool :lang_ger_fluent
      t.bool :lang_good
      t.bool :lang_spa_fluent
      t.bool :lang_spa_good
      t.text :lang_other
      t.text :reason
      t.text :personal_values

      t.timestamps
    end
  end

  def self.down
    drop_table :application_forms
  end
end
