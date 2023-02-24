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
      @bookmark = Bookmark.new # For the form in the show page
      render 'lists/show', status: :unprocessable_entity
      # QUESTION : How to render on the same view in the page ?
      # redirect_to @list, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
