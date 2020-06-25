class UsersController < ApplicationController
  before_action :sign_in, except: [:new, :create]
  before_action :set_params, only: [:edit, :show, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new 
  end
  

  def create
    @user = User.new(user_params) 
    if @user.save 
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'New User created and logged in!'
    else
      flash.now[:notice] = "Please try again!"
      render :new 
    end
  end

  def show
    @upcoming_user_events = current_user.events.upcoming
    @past_user_events = current_user.events.past
  end
  
  def edit
  end

  def update
    @user.update(user_params)

    redirect_to @user
  end

  def destroy
    @user.destroy 
    session[:user_id] = nil
    redirect_to root_path
  end




  private 

  def user_params
    params.require(:user).permit(:name)
  end

  def set_params
    @user = User.find(params[:id])
  end
  
end
