class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @review = Review.all
  end

  def show
    # @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)
    @review.save # Will raise ActiveModel::ForbiddenAttributesError
  end

  def edit
    # @review = Review.find(params[:id])
  end

  def update
    # @review = Review.find(params[:id])
    @review.update(reviews_params)
  end

  def destroy
    # @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path, status: :see_other
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end
end
