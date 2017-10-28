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
    if @review.save
      flash[:result_text] = "Review Saved!"
      redirect_to reviews_path
    else
      render :new
    end
  end


  def destroy
    @review.destroy
  end

private
  def find_review
    @review = Review.find(params[:id].to_i)
  end

  def review_params
    params.require(:review).permit(:name, :text, :relationship, :rating)
  end


end
