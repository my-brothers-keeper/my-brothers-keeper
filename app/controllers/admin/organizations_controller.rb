module Admin
  class OrganizationsController < ApplicationController
    def show
      @organization = Organization.find(params[:id])

      @needs = @organization.needs.order(:item)
    end
  end
end
