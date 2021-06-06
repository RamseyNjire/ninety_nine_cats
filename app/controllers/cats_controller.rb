class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def new
        @cat = Cat.new
        @allowed_colors = Cat::ALLOWED_COLORS
        render :new
    end

    def create
        @cat = Cat.new(cat_params)
        # @allowed_colors = Cat::ALLOWED_COLORS
        if @cat.save
            redirect_to cat_url(@cat)
        else
            render :new
        end
    end

    def show
        @cat = Cat.find_by(id: params[:id])
        render :show
    end

    def edit
        @cat = Cat.find_by(id: params[:id])
        @allowed_colors = Cat::ALLOWED_COLORS

        render :edit
    end

    def update
        @cat = Cat.find_by(id: params[:id])

        if @cat.update_attributes(cat_params)
            redirect_to cats_url
        else
            render :edit
        end
    end

    private
    def cat_params
        params.require(:cat).permit(:name, :birthdate, :color, :sex, :description)
    end
end
