
class SubscriptionsController < ApplicationController

  def create
	@tag = Tag.find_by_name(params[:subscription][:name])
	current_user.subscribe!(@tag)
	respond_to do |format|
      format.html { redirect_to subscribe_user_path(current_user) }
      format.js
    end
  end
  def destroy
  end
end
