class AlbumsController < ApplicationController
    def index
        @bands = Album.all
        render :index
    end
    
    def show
        @album = Album.find(params[:id])
        render :new
    end

    def create
        @album = Album.new(album_params)
        if @album.save!
            redirect_to band_url(@album)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :new
        end
    end

    def edit
        @album = Album.find(params[:id])
        render :edit
    end

    def update
        @album = Album.find(params[:id])
        if @album.update_attributes(album_params)
            redirect_to album_url
        else
            flash.now[:errors] = @album.errors.full_messages
            render :edit
        end
    end

    private
    
    def album_params
        params.require(:album).permit(:title, :year, :studio)
    end
end
