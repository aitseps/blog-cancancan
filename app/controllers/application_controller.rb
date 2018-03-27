class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # check_authorization

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_url, alert: 'You shall not pass!' }
    end
  end

end
