class Notifier < ActionMailer::Base
 def signup_newsletter(id)
 	 @contact = Contact.find_by_id(id)
   recipients @contact.email
   bcc        ["Mail Watcher <watcher@engelandvoelkersnewportbeach.com>"]
   from       "system@engelandvoelkersnewportbeach.com"
   subject    "Welcome to the E&V Newsletter"
   body       :account => @contact
   content_type "text/html"
 end


 def notify_contact_received(id)
 	 @contact = Contact.find_by_id(id)
	 case @contact.interested_in
			when "Buying"
				recipients "omargallob@gmail.com"
			when "Selling"
				recipients "omargallob@gmail.com"
	 end
   from @contact.email
   subject " E&V Contact received - "+@contact.interested_in
   body    :account => @contact
   content_type "text/html"
 end 

 def signup_appform(id)
	@appform = Appform.find_by_id(id)
	recipients @appform.email
   bcc        ["Mail Watcher <watcher@engelandvoelkersnewportbeach.com>"]
   from       "system@engelandvoelkersnewportbeach.com"
   subject    "Thanks for applying"
   body       :account => @appform
   content_type "text/html"
 end

 def notify_appform_received(id)
	@appform = Appform.find_by_id(id)
recipients "omargallob@gmail.com"
   bcc        ["Mail Watcher <watcher@engelandvoelkersnewportbeach.com>"]
   from       "system@engelandvoelkersnewportbeach.com"
   subject    "EV Application form"
   body       :account => @appform
   content_type "text/html"
 end

 def signup_vip(id)
 	 @user = User.find_by_id(id)
   recipients @user.email
   bcc        ["Mail Watcher <watcher@engelandvoelkersnewportbeach.com>"]
   from       "system@engelandvoelkersnewportbeach.com"
   subject    "Welcome to the E&V VIP Newsletter"
   body       :account => @user
   content_type "text/html"
 end
 def notify_vip_received(id)
	 @user = User.find_by_id(id)
	 recipients "omargallob@gmail.com"
   bcc        ["Mail Watcher <watcher@engelandvoelkersnewportbeach.com>"]
   from       "system@engelandvoelkersnewportbeach.com"
   subject    "E&V VIP Contact received -"
   body       :account => @appform
   content_type "text/html"
 end

	def first_lot(id)
		@import = CsvImport.find_by_id(id)
 	 recipients @import.email
   from       "info@engelandvoelkersnewportbeach.com"
   subject    "E&V Newport Beach"
   body       :name => @import
   content_type "text/html"
	end
	def vip_newsletter(id)
 	 @import = CsvImport.find_by_id(id)
 	 recipients @import.email
   from       "vip@engelandvoelkersnewportbeach.com"
   subject    "E&V VIP @ Newport Beach"
   body       :name => @import
   content_type "text/html"
	end

end
