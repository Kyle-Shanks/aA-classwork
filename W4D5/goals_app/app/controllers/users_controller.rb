class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render :show
    else
      flash[:errors] = ['User could not be found']
      redirect_to goals_url
    end
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new, status: 422
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    render :edit
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    redirect_to goals_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
