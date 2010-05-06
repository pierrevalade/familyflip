class UserSessionsController < ApplicationController
  
  layout "welcome"
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
    @user_session = UserSession.new(:remember_me => true)
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      #flash[:notice] = "Login successful!"
      redirect_back_or_default '/welcome'
    else
      flash.now[:error] = "Wrong Username/Email and password combination."
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end
end