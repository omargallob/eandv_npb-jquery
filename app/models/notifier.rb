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

end
