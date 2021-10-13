class UsersController < ApplicationController

    before_action :require_current_user!, except: [:create, :new]

    def new
        @users = User.all
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def user_params
        params.require(:user).permit(:username, :email, :age, :password)
    end
            

end
