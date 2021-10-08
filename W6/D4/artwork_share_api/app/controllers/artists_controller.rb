class ArtistsController < ApplicationController

    def create
        user = Artist.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def destroy
        user = Artist.find(params[:id])
        if user.destroy

        render json: user

        end
    end

    def index
        users = Artist.all
        render json: users
    end

    def show
        user = Artist.find(params[:id])
        render json: user
    end

    def update
        user = Artist.find(params[:id])
        if user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end


    private

    def user_params
        params.require(:artist).permit(:username)
    end

end