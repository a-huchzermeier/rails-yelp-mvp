class RestaurantsController < ApplicationController
def index
  @restaurants = Restaurant
    .left_joins(:reviews)
    .select("restaurants.*, AVG(reviews.rating) AS avg_rating")
    .group("restaurants.id")
end

  def show
  @restaurant = Restaurant.find(params[:id])
  end

  def new
  @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  def average_rating
    reviews.average(:rating)&.round(1)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
