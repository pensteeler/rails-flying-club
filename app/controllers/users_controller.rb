class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'users/new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  #private

  #def user_params
  #  params.require(:user).permit(:name, :email, :password, :password_confirmation)
  #end

end
