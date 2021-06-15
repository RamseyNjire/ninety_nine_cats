class CatsController < ApplicationController
  helper_method :current_user_owns_cat?
  before_action :require_current_user!, except: [:index, :show]
  before_action :edit_own_cat, only: [:edit, :update]
  
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.owner = current_user
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex)
  end

  def edit_own_cat
    unless current_user.cats.exists?(id: params[:id])
      redirect_to cats_url
    end
  end

  def current_user_owns_cat?
    @cat = Cat.find(params[:id])
    current_user == @cat.owner
  end
end
