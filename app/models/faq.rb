class Faq < ActiveRecord::Base

	validates_presence_of :question, :answer, :username
	validates_uniqueness_of :question, :answer

end
