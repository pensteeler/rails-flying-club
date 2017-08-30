class User < ApplicationRecord
  has_secure_password

  validates :email, :presence => true
  validates :email, :uniqueness => true

  def self.find_or_create_by_omniauth( auth_hash )
    # authenticated from github
    self.where( :email => auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandon.hex
    end

    #if @user = User.find_by( :email => oauth_email )
      # raise "EXISTING USER LOGGING IN VIA GITHIB".inspect
      # I've seen this user before, just log them in.
      #session[:user_id] = @user.id
      #redirect_to @user  #redirect_to root_path

      # user was found
      #return @user
    #else
      # raise "NEW USER LOGGING IN VIA GITHIB".inspect
      # I know who the person is, but it's the first time
      # they have come to my application
      # Create a new user Object
      #@user = User.create( :email => oauth_email, :password => SecureRandon.hex )

      #@user = User.new( :email => oauth_email, :password => SecureRandon.hex )
      #if @user.save
        #session[:user_id] = @user.id
        #redirect_to @user  #redirect_to root_path
      #else
      #  raise @user.errors.full_messages.inspect
      #end
    #end

end
