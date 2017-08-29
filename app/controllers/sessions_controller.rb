class SessionsController < ApplicationController
  def new
  end

  def create
    #if  !params[:email] || params[:email].empty?
    @user = User.find_by( :email => params[:email])
    if @user && @user.authenticate( params[:password] )
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'sessions/new'
    end
  end

  def destroy
    session.delete :name
    #redirect_to root_path
  end
end
