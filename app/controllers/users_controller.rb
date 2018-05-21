# Permit user to enter data into params and create an account
class UsersController < ApplicationController
  layout 'admin'

  before_action :require_valid_token!

  def new
    if (@user = pending_user)
      render :new
    else
      redirect_to login_path, alert: 'Invalid invitation token'
    end
  end

  # Assign user's entered data/params to a variable, if it's accepted into the DB, redirect them to login

  def create
    if pending_user.update(user_params)
      flash[:alert] = 'Your account has been successfully created'

      redirect_to login_path
    else
      @user = pending_user

      render 'new'
    end
  end

  private

  # Make params acccessible for account creation

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def pending_user
    return @pending_user if defined?(@pending_user)

    token = params[:token]

    token && (@pending_user = InvitationToken.user_for_token(token))
  end

  def require_valid_token!
    return if pending_user

    redirect_to login_path, alert: 'Invalid invitation token'
  end
end
