class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to user_url(@user.id)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render :show
    else
      flash[:errors] = ['Could not locate user']
      redirect_to bands_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
