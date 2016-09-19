class SessionsController < ApplicationController
  before_action :require_no_user!, except: [:destroy]

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user
      login_user!(user)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] += user.errors.full_messages
      render :new
    end
  end

  def destroy
    if current_user
      @current_user.reset_session_token!
      session[:session_token] = nil
    end
    render :new
  end
end
