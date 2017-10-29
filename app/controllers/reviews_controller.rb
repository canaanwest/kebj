class ReviewsController < ApplicationController
  before_action :find_review
  def index
    @reviews = Review.order(:id)
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

  def edit
  end

  def update
    @review.update_attributes review_params
    if @review.save
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
    @review = Review.find_by(id: params[:id].to_i)
  end

  def review_params
    params.require(:review).permit(:id, :name, :text, :relationship, :rating)
  end


end
