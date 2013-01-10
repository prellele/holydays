class ApplicationController < ActionController::Base
  protect_from_forgery

  def redirect
    redirect_to "/calendar"
  end

end