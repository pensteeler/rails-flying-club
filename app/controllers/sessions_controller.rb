class SessionsController < ApplicationController
  def new
  end

  def create

    if auth_hash = request.env["omniauth.auth"]
      # They loggin in via OAuth

      #########################################################
      # These three lines of code can replace the following for
      # logging in via Github
      # @user = User.find_or_create_by_omniauth( auth_hash )
      # session[:user_id] = @user.id
      # redirect_to @user  #redirect_to root_path
      #########################################################

      # start
      oauth_email = request.env["omniauth.auth"]["info"]["email"]  # authenticated from github
      if @user = User.find_by( :email => oauth_email )
        # raise "EXISTING USER LOGGING IN VIA GITHIB".inspect
        # I've seen this user before, just log them in.
        session[:user_id] = @user.id
        redirect_to @user  #redirect_to root_path
      else
        # raise "NEW USER LOGGING IN VIA GITHIB".inspect
        # I know who the person is, but it's the first time
        # they have come to my application
        # Create a new user Object
        @user = User.new( :email => oauth_email, :password => SecureRandon.hex )
        if @user.save
          session[:user_id] = @user.id
          redirect_to @user  #redirect_to root_path
        else
          raise @user.errors.full_messages.inspect
        end
      end
      # End of refactored code if we used find_or_create_by_omniauth( auth_hash )
    else
      # Normal login with username/password

      #if  !params[:email] || params[:email].empty?
      @user = User.find_by( :email => params[:email])
      if @user && @user.authenticate( params[:password] )
        session[:user_id] = @user.id
        redirect_to @user  #redirect_to root_path
      else
        render 'sessions/new'
      end
    end
  end

  def destroy
    session.delete :name
    #redirect_to root_path
  end

  #def destroy
  #  reset_session
  #  redirect_to login_path
  #end

end
