class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def redirect_if_not_admin
    if !current_user.admin?
      redirect_to :root, :alert => "Not Authorized"
    end  
  end

end