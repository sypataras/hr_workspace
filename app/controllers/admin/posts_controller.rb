class Admin::PostsController < ApplicationController
  before_action :check_admin!

  def new
    @post = current_class.new
  end

  def index
    @posts = current_class.search(params[:search])
  end

  def create
    post = current_class.new(post_params)
    if post.save
      redirect_to admin_posts_path
    else
      raise "Cant create post : #{@post.errors.full_messages}"
    end
  end

  def update
    @post = current_class.find_by_id(params[:id])
    if @post
      update_part
      redirect_to admin_posts_path
    else
      raise 'Cant find post'
    end
  end

  def show
    @post = current_class.find(params[:id])
    @groups = Group.without_posts
    @users = User.show_users.without_posts
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

  def update_part
    @post.update(post_params)
    add_user if params[:user_id].present?
    add_group if params[:group_id].present?
  end

  def add_user
    @post.users_posts.find_or_create_by(user_id: params[:user_id])
  end

  def add_group
    @post.add_group(params[:group_id])
  end

  def current_class
    Post
  end

  def post_params
    params.require(:post).permit(:title, :text, :photo, :document)
  end
end
