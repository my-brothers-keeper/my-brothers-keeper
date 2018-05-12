module Admin
  class OrganizationsController < ApplicationController
    def show
      @organization = Organization.find(params[:id])

      @needs = @organization.needs.order(:item).includes(:category)
    end
  end
end
