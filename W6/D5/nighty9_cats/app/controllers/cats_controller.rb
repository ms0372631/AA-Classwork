class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render index
    end

    def show
        @cat = Cat.find(params[:id])
        render show
    end

    def new
      @cat = Cat.new
      render :new
    end

    def create
      @cat = Cat.new(cat_params)
      if @cat.update(cat_params)
        redirect_to cats_url    
      else
        redirect_to new_cat_url
      end
    end

    def cat_params
      params.require(:cat).permit(:name, :birth_date, :sex, :color, :description)
    end

end
