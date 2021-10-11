class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username],params[:user][:password])
    if @user
      login(@user)
      Session[:session_token] = User.reset_session_token!
      redirect_to users_url
    else
      render json: ['Invalid Username or Password']
    end
  end

  def destroy

  end

end
