class BookmarksController < ApplicationController

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
     @bookmark = Bookmark.new(bookmark_params)
     @topic = Topic.find(params[:topic_id])
     @bookmark.topic = @topic

    if @bookmark.save
      flash[:notice] = "New BlocMark was saved."
      redirect_to [@topic, @bookmark]
    else
      flash.now[:alert] = "There was an error saving the BlocMark.  Please try again."
      render :new
    end
  end
    
  def edit
    @bookmark = Bookmark.find(params[:id])
  end
   
  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.url = params[:bookmark][:url]

    if @bookmark.save
      flash[:notice] = "The BlocMark was updated."
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash.now[:alert] = "There was an error updating the BlocMark. Please try again."
      render :edit
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
 
    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
      redirect_to @bookmark.topic
    else
      flash.now[:alert] = "There was an error deleting the BlocMark."
      render :show
    end
  end
  
  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

end