class PostsController < ApplicationController
  before_action :check_user!
  after_action :check_read!, only: [:show]

  def index
    @posts = current_user.posts
  end

  def show
    @post = current_user.posts.find_by_id(params[:id])
    raise 'you dont have access' if @post.nil?
  end

  private

  def check_read!
    current_user.readed(@post.id)
  end
end
