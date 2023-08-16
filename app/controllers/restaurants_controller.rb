class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    # @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurants_params)
    if @restaurant.save
      redirect_to restaurants_path(@restaurant.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @restaurant = Restaurant.find(params[:id])
  end

  def update
    # @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurants_params)
    redirect_to restaurants_path(@restaurant.id)
  end

  def destroy
    # @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurants_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
