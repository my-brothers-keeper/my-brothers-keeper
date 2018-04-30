class UsersController < ApplicationController
  def index
  end

  # Permit user to enter data into params and create an account

  def new
    @user = User.new
  end

  # Assign user's entered data/params to a variable, if it's accepted into the DB, redirect them to login

  def create 
    @user = User.new(user_params)
    if @user.save
      redirect_to '/login'
    else
      render 'new'
    end 
  end

  private

  # Make params acccessible throughout Users Controller

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
