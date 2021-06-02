class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def new
        @cat = Cat.new
        @allowed_colors = Cat::ALLOWED_COLORS
        @allowed_sexes = Cat::ALLOWED_SEXES
        render :new
    end

    def create
        @cat = Cat.new(cat_params)
        @allowed_colors = Cat::ALLOWED_COLORS
        @allowed_sexes = Cat::ALLOWED_SEXES
        if @cat.save
            redirect_to cat_url(@cat)
        else
            render :new
        end
    end

    def show
        @cat = Cat.find(params[:id])
        render :show
    end

    private
    def cat_params
        params.require(:cat).permit(:name, :birthdate, :color, :sex)
    end
end
