class AddAttachmentsPdfToProperty < ActiveRecord::Migration
  def self.up
    add_column :properties, :pdf_file_name, :string
    add_column :properties, :pdf_content_type, :string
    add_column :properties, :pdf_file_size, :integer
    add_column :properties, :pdf_updated_at, :datetime
  end

  def self.down
    remove_column :properties, :pdf_file_name
    remove_column :properties, :pdf_content_type
    remove_column :properties, :pdf_file_size
    remove_column :properties, :pdf_updated_at
  end
end
