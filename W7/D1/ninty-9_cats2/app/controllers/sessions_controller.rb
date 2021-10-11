class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username],params[:user][:password])
    if @user
      login(@user)
      redirect_to users_url
    else
      render json: ['Invalid Username or Password']
    end
  end

  def destroy
    logout
  end

end
