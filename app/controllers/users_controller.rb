class UsersController < ApplicationController
 def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the TV Guide!"
      send_hello @user 
      redirect_to @user
    else
      render 'new'
    end
  end
  def subscribe
    @title = "Subscribed Tags"
    @user = User.find(params[:id])
    render 'show_subscribe'
  end
end
