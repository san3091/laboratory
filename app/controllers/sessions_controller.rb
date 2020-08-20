class SessionsController < ApplicationController
  skip_before_action :authorized
  layout "unauth"

  def new
  end

  def create
    admin = Admin.find_by(email: params[:email])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      flash[:success] = 'Successfully logged in'
      redirect_to root_path
    else
      flash[:error] = 'Invalid credentials'
      redirect_to '/login'
    end
  end

  def destroy
    session[:admin_id] = nil
    flash[:success] = 'Successfully logged out'
    redirect_to '/login'
  end
end
