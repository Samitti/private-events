class ApplicationController < ActionController::Base

  private


  def sign_in
    unless current_user
      redirect_to new_session_path, notice: 'Please sign in first'
    end
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
