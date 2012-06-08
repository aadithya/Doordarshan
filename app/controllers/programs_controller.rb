class ProgramsController < ApplicationController
require 'gmail'
def search_results
if params[:channel] == "true"
  @programs = Program.where("channel = '#{params[:search]}'").paginate(:page => params[:page])
else
  @programs = Program.search params[:search], params[:page]
end
end

def subscribe
  SubscribeList.create(:user_id => current_user.id, :program_id => params[:program]) 
  send_subscribed(params[:program],current_user)
    redirect_to current_user
end

def unsubscribe
  subscription = SubscribeList.find_by_user_id_and_program_id( current_user.id,  params[:program]) 
  subscription.delete()
  redirect_to current_user
end

end

