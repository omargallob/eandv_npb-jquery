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
				recipients "ryanstoke@hotmail.com"
			when "Selling"
				recipients "ryanstoke@hotmail.com"
	 end
   from @contact.email
   subject " E&V Contact received - "+@contact.interested_in
   body    :account => @contact
   content_type "text/html"
 end 

end
