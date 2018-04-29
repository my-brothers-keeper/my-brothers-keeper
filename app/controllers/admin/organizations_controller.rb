module Admin
  class OrganizationsController < ApplicationController
    def show
      @organization = Organization.find(params[:id])
    end
  end
end
