class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user
      login_user!(user)
    else
      flash.now[:errors] = ["Error"]
      render :new
    end
  end

  def destroy
    logout_user!(current_user)
  end
end
