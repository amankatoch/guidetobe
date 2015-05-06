
class PostsController < ApplicationController

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all(:order => "created_at DESC")
    end
  end

  def show
    @post = Post.friendly.find(params[:id])
    @page_title = @post.title
    @page_description = 'Read our blog post on ' + @post.title
    @page_keywords    = @post.title 
  end

end