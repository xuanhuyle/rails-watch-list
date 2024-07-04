class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @movies = Movie.all # This will be used to populate the dropdown of movies
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully created.'
    else
      @movies = Movie.all
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    list = @bookmark.list
    @bookmark.destroy
    redirect_to list, notice: 'Bookmark was successfully deleted.'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
