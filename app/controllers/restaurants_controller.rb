class RestaurantsController < ApplicationController
    def index
      @restaurants = Restaurant.all      
    end

    def show
      @restaurant = Restaurant.find(params[:id])
    end

    def new
      @restaurant = Restaurant.new
    end

    def create
        @review = Review.new(review_params)
        # we need `restaurant_id` to associate review with corresponding restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review.restaurant = @restaurant
        @review.save
        redirect_to restaurant_path(@restaurant)
    end
    
    private

    def review_params
      params.require(:review).permit(:content)
    end
end
