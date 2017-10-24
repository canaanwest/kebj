class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new review_params
  end


  def destroy
    @review.destroy
  end

private
  def find_review
    @review = Review.find(params[:id].to_i)
  end

  def review_params
    pararms.require(:review).permit()
  end


end
