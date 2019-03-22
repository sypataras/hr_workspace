class Admin::MainController < ApplicationController
  def root
    redirect_to new_user_session_path unless current_user
    if current_user.admin?
      redirect_to admin_posts_path
    else
      redirect_to posts_path
    end
  end

  def error
    @is_admin = current_user.admin?
  end
end
