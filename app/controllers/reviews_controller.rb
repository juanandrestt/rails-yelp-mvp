class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]
  before_action :set_restaurant, only: %i[ new create ]

  def index
    @reviews = Review.all
  end

  def show
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to @restaurant, notice: "Review was successfully created."
    else
      render "restaurants/show", status: :unprocessable_entity
    end
  end

  def update
    if @review.update(review_params)
      redirect_to @review, notice: "Review was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy!
    redirect_to reviews_path, status: :see_other, notice: "Review was successfully destroyed."
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def review_params
      params.require(:review).permit(:rating, :content, :restaurant_id)
    end
end
