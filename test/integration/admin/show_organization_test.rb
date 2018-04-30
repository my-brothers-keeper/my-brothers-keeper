require 'test_helper'

module Admin
  class ShowOrganizationTest < ActionDispatch::IntegrationTest
    test "show organization details" do
      organization = create(:organization, name: 'Shelter for homeless')

      get "/admin/organizations/#{organization.id}"

      assert_select 'h1', 'Shelter for homeless'
    end
  end
end