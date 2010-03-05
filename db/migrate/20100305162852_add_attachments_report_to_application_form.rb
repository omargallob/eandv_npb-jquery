class AddAttachmentsReportToApplicationForm < ActiveRecord::Migration
  def self.up
    add_column :application_forms, :report_file_name, :string
    add_column :application_forms, :report_content_type, :string
    add_column :application_forms, :report_file_size, :integer
    add_column :application_forms, :report_updated_at, :datetime
  end

  def self.down
    remove_column :application_forms, :report_file_name
    remove_column :application_forms, :report_content_type
    remove_column :application_forms, :report_file_size
    remove_column :application_forms, :report_updated_at
  end
end
