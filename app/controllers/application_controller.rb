class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def send_subscribed(program_id,user)
    Gmail.new("remotecontroller1", "remotecontroller") do |gmail|
      notify_subscribe(gmail, program_id, user)
    end
  end

  def send_hello(user)
    Gmail.new("remotecontroller1", "remotecontroller") do |gmail|
      notify_hello(gmail, user)
    end
  end

  def notify_hello( gmail, user)
    gmail.deliver do
      to user.email
    subject "Welcome to the TV Guide " 
    text_part do
      body "Thanks for registering at the TV Guide. We look forward to a great relationship. "
    end
  end
 end 

  def notify_subscribe( gmail, program_id, user)
  gmail.deliver do
    to user.email
    prog = Program.find(program_id)
    subject "You just subscribed to " + prog.title
    text_part do
      body "You just subscribed to " + prog.title  + " from the TVG"
    end
  end
 end 
end
