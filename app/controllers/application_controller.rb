class ApplicationController < ActionController::Base
  def require_user
    #if user is a guest, then redirect to Login page
    if guest?
      flash[:notice] = "You must login to view blogs"
      redirect_to login_path
    end
  end

  def already_signed_in? 
    if !guest?
      flash[:notice] = "User already signed in"
      redirect_to blogs_path
    end
  end

  def guest?
    !helpers.logged_in?
  end
end
