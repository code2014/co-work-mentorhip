class SessionController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password] ) 
      if (params[:remember] == "true")
        cookies.permanent[:user_token] = {:value => user.token}
      else
        cookies[:user_token] = {:value => user.token}
      end
      redirect_to user
    else
      flash.now.alert = "Invalid email or password"
      render "form"
    end
  end

  def destroy
    cookies.delete :user_token
    redirect_to root_url
  end
end
