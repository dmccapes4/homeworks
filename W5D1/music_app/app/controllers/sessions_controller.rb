class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.new(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      login(@user)
      redirect_to bands_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
