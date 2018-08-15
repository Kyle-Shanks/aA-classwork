class SessionsController < ApplicationController
  before_action :check_if_logged_in, only: [:new, :create]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user
      login!(user)
      redirect_to cats_url
    else
      flash.now[:errors] = ['Invalid credentials']
      render :new
    end
  end

  def destroy
    logout!
    redirect_to cats_url
  end

  private

  def check_if_logged_in
    redirect_to cats_url if current_user
  end
end
