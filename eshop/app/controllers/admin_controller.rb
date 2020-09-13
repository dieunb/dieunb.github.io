class AdminController < ActionController::Base
  before_action :authenticate_user!
  before_action :admin_user_verify!

  private

  def admin_user_verify!
    return true
  end
end
