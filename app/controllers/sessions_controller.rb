# User enters login data, we assign to a variable and check its params against
# the database to log them in.  If entered data doesn't match, just reload the
# login page
class SessionsController < ApplicationController
  layout 'admin'

  def create 
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.valid_password?(params[:session][:password])
      sign_in @user
      redirect_to admin_path
    else
      render :new
    end
  end

    # Destroy session (log out) and bring user back to the main login page

  def destroy
    sign_out
    redirect_to login_path
  end
end
