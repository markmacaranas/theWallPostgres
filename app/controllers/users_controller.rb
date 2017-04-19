class UsersController < ApplicationController
  def new
  end

  def login

      @user = User.find_by(username: params[:username])

      if @user
        session[:user_id] = @user.id
        redirect_to '/messages'
      else
        flash[:errors] = ['Could not find username']
        redirect_to '/users'
      end
  end

  def logout
    reset_session
    redirect_to '/users'
  end
end
