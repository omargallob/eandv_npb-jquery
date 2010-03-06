class Appform < ActiveRecord::Base

has_attached_file :resume,
										:content_type => "pdf",
										:storage => :s3,
										:s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
										#:url =>  "/property/gallery/:id/:style/:basename.jpg",
										:path => "assets/resumes/:email/pdf/:style/:basename.pdf"
has_attached_file :report,
										:content_type => "pdf",
										:storage => :s3,
										:s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
										#:url =>  "/property/gallery/:id/:style/:basename.jpg",
										:path => "assets/report/:email/pdf/:style/:basename.pdf"

validates_presence_of :first_name, :last_name, :email, :telephone
validates_attachment_presence :resume
end
