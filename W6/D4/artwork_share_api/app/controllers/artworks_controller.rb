class ArtworksController < ApplicationController

  def index
    artwork = Artwork.all
    render json: artwork
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])

    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      redirect_to image_url(artwork)
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

end