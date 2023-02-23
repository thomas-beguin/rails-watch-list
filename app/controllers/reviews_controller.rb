class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @list = List.find(params[:list_id])
    @review = Review.new(review_params)
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      @list = List.find(params[:id])
      @bookmark = Bookmark.new
      @review = Review.new
      render 'lists/show', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
