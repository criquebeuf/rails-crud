class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show
    # id comes from the data base, then being used in the route/url
    # id = params[:id]
    # @restaurant = Restaurant.find(id)
    # or faster=> @restaurant = Restaurant.find(params[:id])
  end

  def new
    # render a new form
    # this could be @new_restaurant, we don't mind. Its just a convention to call them all the same
    @restaurant = Restaurant.new # creates a NEW EMPTY FORM
  end

  def create
    # create a new instance of restaurant
    @restaurant = Restaurant.new(restaurant_params) # I can pass just :restaurant which is the entire HASH
    @restaurant.save # Will raise ActiveModel::ForbiddenAttributesError
    # specify where to redirect the user after they submit
    redirect_to restaurant_path(@restaurant) # If i pass the entire @restaurant ruby is clever enough to get the id
  end

  def edit
    # all it does: render and edit form
    # @restaurant = Restaurant.find(params[:id])
  end

  def update
    # @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params) # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to restaurant_path(@restaurant) # If i pass the entire @restaurant ruby is clever enough to get the id
  end

  def destroy
    # @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to restaurants_path, status: :see_other
  end

  private

  # Strong params: this is to permit to edit params via the form. We have to use strong params
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end

  def set_restaurant
    Restaurant.find(params[:id])
  end
end
