class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end
  
  def new
    @bookmark = Bookmark.new
  end
  
  def create
    @bookmark = Bookmark.new(title: params[:bookmark][:title], url: params[:bookmark][:url], interest: params[:bookmark][:interest])
    if @bookmark.save
      flash[:notice] = '1レコード追加しました'
      redirect_to '/'
    else
      render 'new', status: :unprocessable_entity
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    flash[:notice] = '1レコード削除しました'
    redirect_to '/'
  end
  
  def show
    @bookmark = Bookmark.find(params[:id])
  end
  
  def edit
    @bookmark = Bookmark.find(params[:id])
  end
  
  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update(title: params[:bookmark][:title], url: params[:bookmark][:url], interest: params[:bookmark][:interest])
      flash[:notice] = '更新しました'
      redirect_to '/'
    else
      render 'edit', status: :unprocessable_entity
    end
  end
  
end
