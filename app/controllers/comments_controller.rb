class CommentsController < ApplicationController

  # ===========
  # = Filters =
  # ===========
  before_filter :find_photo
  
  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # POST /comments
  def create
    @comment = @photo.comments.build(params[:comment])
    @comment.author = session[:username]

    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to(@photo)
    else
      render :action => "new"
    end
  end

  # DELETE /comments/1
  def destroy
    @comment = @photo.comments.find(params[:id])
    @comment.destroy

    redirect_to @photo
  end
  
  private
  
    def find_photo
      @photo = Photo.find params[:photo_id]
    end
end
