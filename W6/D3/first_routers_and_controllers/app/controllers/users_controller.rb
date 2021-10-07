class UsersController < ApplicationController
  def edit
    # user = User.find(params[:id])
    render json: params
  end
end