class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_user!
  	if !(current_user)
  		flash[:danger] = "You must be logged in to do that!"
    	redirect_to '/login'
    end
  end
  
end
