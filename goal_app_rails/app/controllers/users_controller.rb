class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      sign_in(@user)
      redirect_to :index
    else
      flash.now[:errors] = @users.errors.full_messages
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    @user.redirect_to :new
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
