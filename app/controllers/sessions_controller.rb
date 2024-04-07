class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert:"Invalid username or password"
    end
  end
  def destroy
    session[:user_id] = nill
    redirect_to login_url, alert:"Sucessfully logged out"
  end
end