class Admin::UsersController < ApplicationController
  before_action :check_admin!

  def new
    @user = current_class.new
  end

  def create
    user = current_class.new(user_create_params)
    if user.save
      redirect_to admin_users_path
    else
      raise "Cant create post : #{user.errors.full_messages}"
    end
  end

  def index
    @users = current_class.search(params[:search])
  end

  def show
    @user = current_class.find(params[:id])
    @group = Group.all
  end

  def update
    @user = current_class.find_by_id(params[:id])
    if @user
      @user.update(user_update_params)
      redirect_to admin_users_path
    else
      raise 'Cant find user'
    end
  end

  def destroy
    @user = current_class.find(params[:id])
    if @user.destroy
      redirect_to admin_users_path
    else
      raise 'Cant delete user'
    end
  end

  private

  def current_class
    User
  end

  def user_create_params
    params.require(:user).permit(:first_name, :last_name, :email, :password_confirmation, :password)
  end

  def user_update_params
    user_update_params = params.permit(:first_name, :last_name)
    user_update_params[:group_ids] = @user.group_ids.push(params[:group_id])
    user_update_params
  end
end
