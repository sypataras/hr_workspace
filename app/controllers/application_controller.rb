class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  protected

  def check_admin!
    redirect_to admin_main_url unless current_user.admin?
  end
end
