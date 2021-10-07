class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def edit
    # user = User.find(params[:id])
    render json: params
  end

  def create
    user = User.new(params.require(:user).permit(:name, :email))
    if user.save!
      render json: user
    else
      render json: user.errors.full.messages, status: :unprocessable_entity
    end
  end
end