class SessionsController < ApplicationController
  def new

  end

  def create 
    user = User.find_by_name(params[:name])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "You are signed in #{user.name}"
    else
      flash.now[:notice] = 'Your are not a user' 
      render :new
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path, notice: "You signed out"
  end
  
end
