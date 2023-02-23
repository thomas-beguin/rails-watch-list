class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      # render :new, status: :unprocessable_entity
      render 'lists/show', status: :unprocessable_entity
      # format.turbo_stream do
      #   render turbo_stream: turbo_stream.replace('modal_form',
      #                                               partial: "bookmarks/modal_form",
      #                                               locals: { bookmark: @bookmark })
      # end
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
