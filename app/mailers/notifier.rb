class Notifier < ActionMailer::Base
  default from: "aadithya.c@gmail.com"

 def welcome(recipient)
    mail(:to => recipient)
  end 
end
