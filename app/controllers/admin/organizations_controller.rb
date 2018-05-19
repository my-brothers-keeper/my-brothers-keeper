module Admin
  class OrganizationsController < BaseController
    def show
      @organization = current_user.organization

      @needs = @organization.needs.order(:item).includes(:category)
    end
  end
end
