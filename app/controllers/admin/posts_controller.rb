class Admin::PostsController < ApplicationController

  before_action :authenticate_admin
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  layout 'admin_application'

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to admin_post_path(@post), notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to admin_post_path(@post), notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path, notice: 'Post was successfully destroyed.'
  end

  private
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :author, :published_on, :visible, :tag_list, :image)
    end
end
