class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(
      params[:user][:name_or_email],
      params[:user][:password],
    )

    if user
      login!(user)
      redirect_to user_url(user.id)
    else
      flash.now[:errors] = ['Invalid Credentials']
      render :new
    end
  end

  def destroy
    logout!
    redirect_to bands_url
  end
end
