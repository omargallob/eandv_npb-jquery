class ApplicationForm < ActiveRecord::Base
 validates_presence_of :name, :surname, :email, :telephone

end
