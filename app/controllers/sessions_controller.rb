class SessionsController < ApplicationController

  def new
  end

  def create
    #Use authenticate method from user to check if user exists and return user, pass email and password entered
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Create a cookie with user id
      session[:user_id] = user.id
      redirect_to '/'
    else
        redirect_to '/login'
      end
  end

  def destroy
    # Once cookie destroyed, it will recognized we've logged out and bring us to login page.
    session[:user_id] = nil
    redirect_to '/login'
  end

end