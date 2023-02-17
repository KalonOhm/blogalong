class SessionsController < ApplicationController
  before_action :already_signed_in?, except: [:destroy]
  #GET - Login Page
  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      flash[:notice] = "Login successful"
      redirect_to blogs_path
    else
      flash[:notice] = "Login failed"
      render :new, status: :unprocessable_entity
    end

    def destroy
      session[:user_id] = nil
      flash[:notice] = "Logout successful"
      redirect_to login_path
    end

  end
end
