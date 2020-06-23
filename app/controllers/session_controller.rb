class SessionController < ApplicationController

  def new

  end

  def create 
    # @user = User.find(params[:id])
    session[:user_id] = @user.id
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
end
