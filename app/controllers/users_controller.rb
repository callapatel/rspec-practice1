class UsersController < ApplicationController


  def new

  end

  def create
    @user = User.new(params.require(:user).permit(:email))
    @user.save
    #send an email

    UserMailer.sign_up(@user.id).deliver #without deliver it wont send, just sets it up. 
    session[:user_id] = @user.id
    #puts @user.errors.inspect
    #puts params.inspect
    redirect_to root_path
  end
end
