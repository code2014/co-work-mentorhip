class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :search_bar

  def current_user
    @current_user ||=User.find_by_token(cookies[:user_token]) if cookies[:user_token]
  end
  helper_method :current_user
  
  def authorize_edit(user)
    current_user == user
  end
  
  def authorize_loggedin 
    render :template => "sessions/restricted" if current_user.nil?
  end
  
  
  protected

  def search_bar
    @q = User.search(params[:q])
  end
end
