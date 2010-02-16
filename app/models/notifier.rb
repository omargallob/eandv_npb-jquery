class Notifier < ActionMailer::Base
 def signup_newsletter(contact)
   recipients contact.email
   bcc        ["Mail Watcher <watcher@engelandvoelkersnewportbeach.com>"]
   from       "omargallob@gmail.com"
   subject    "Welcome to the E&V Newsletter"
   body       :account => contact
 end

end
