class UsersController < ApplicationController
  before_action :set_params, only: [:edit, :show, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new 
  end
  

  def create
    @user = User.new(user_params) 
    @user.save 

    redirect_to root_path
  end

  def show
  end
  
  def edit
  end

  def update
    @user.update(user_params)

    redirect_to @user
  end

  def destroy
    
    @user.destroy 

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
