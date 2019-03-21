class Admin::PostsController < ApplicationController
  before_action :check_admin!

  def new
    @post = current_class.new
  end

  def index
    @posts = current_class.all
  end

  def create
    post = current_class.new(post_params)
    if post.save
      redirect_to admin_posts_path
    else
      raise "Cant create post : #{post.errors.full_messages}"
    end
  end

  def update
    post = current_class.find(params[:id])
    if post
      post.update(post_params)
      redirect_to admin_posts_path
    else
      raise 'Cant find post'
    end
  end

  def show
    @post = current_class.find(params[:id])
  end

  def destroy
    post = current_class.find(params[:id])
    if post.destroy
      redirect_to admin_posts_path
    else
      raise 'Cant delete post'
    end
  end

  private

  def current_class
    Post
  end

  def post_params
    params.require(:post).permit(:title, :text, :photo, :document)
  end
end
