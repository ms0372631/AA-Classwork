class UsersController < ApplicationController
  before_action :require_logout, only: [:new, :create]


  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      log_in(@user)
      puts "entered: redirect_to users_url after creating a user."
      redirect_to users_url
    else
      flash.now[:errrors] = @user.errors.full_messages
      render :new
    end
  end

  def show
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
