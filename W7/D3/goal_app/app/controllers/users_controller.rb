class UsersController < ApplicationController

  before_action :require_logged_in, except: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def index 
    @user = User.all
    render :index
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def show
    @user = User
  end

  def show 
    @user = User.find(param[:id])
    render :show
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new, status: 422
    end
  end

  def update 
    user = User.find(params[:id])

    if user.update(user_params)
      redirect_to user_url 
    else
      render jsons: user.errors.full_messages, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_url
  end


  def user_params 
    params.require(:user).permit(:username)
  end
  
end
