class UsersController < ApplicationController
  # Permit user to enter data into params and create an account

  def new
    @user = User.new
  end

  # Assign user's entered data/params to a variable, if it's accepted into the DB, redirect them to login

  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:alert] = "Your account has been successfully created"
      redirect_to login_path
    else
      render 'new'
    end 
  end

  private

  # Make params acccessible for account creation

  def user_params
    params.require(:user).permit(:organization_id, :username, :email, :password)
  end
end
