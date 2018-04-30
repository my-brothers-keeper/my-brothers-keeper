class SessionsController < ApplicationController
    # User enters login data, we assign to a variable and check its params against the database to log them in.  If entered data doesn't match, just reload the login page

  def create 
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to user_path
    else
      render :new
    end
  end

    # Destroy session (log out) and bring user back to the main login page

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
