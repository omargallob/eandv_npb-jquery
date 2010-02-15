class Notifier < ActionMailer::Base
 def signup_newsletter(recipient)
   recipients recipient.email_address_with_name
   bcc        ["Mail Watcher <watcher@engelandvoelkersnewportbeach.com>"]
   from       "system@engelandvoelkersnewportbeach.com"
   subject    "Welcome to the E&V Newsletter"
   body       :account => recipient
 end

end
