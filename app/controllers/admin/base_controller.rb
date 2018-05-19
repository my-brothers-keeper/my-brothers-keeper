# frozen_string_literal: true

module Admin
  # Base class for shared admin functionality
  class BaseController < ApplicationController
    before_action :require_login
    layout 'admin'

    private
  
    def require_login
      unless logged_in?
        flash[:alert] = 'You must be logged in to access this section'
        redirect_to login_path
      end
    end
  end
end