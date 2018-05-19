module Admin
  class OrganizationsController < BaseController
    def show
      @organization = Organization.find(current_user.organization_id)

      @needs = @organization.needs.order(:item).includes(:category)
    end
  end
end
