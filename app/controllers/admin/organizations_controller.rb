module Admin
  class OrganizationsController < BaseController
    def show
      @organization = Organization.find(params[:id])

      @needs = @organization.needs.order(:item).includes(:category)
    end
  end
end