class Worker < ActiveRecord::Base
   has_attached_file :photo,
                       :styles => {
                         :pagesize => ["120x300>", :jpg]
                       },:convert_options => {  
                             :pagesize => "-strip -quality 60"
                       },
                       :storage => :s3,
                       :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                       :path => "staff/worker/:id/:style/:basename.jpg"
end
