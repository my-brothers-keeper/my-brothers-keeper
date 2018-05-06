require "application_system_test_case"

module Admin
  class AddNeedsTest < ApplicationSystemTestCase
    test 'add an item that the organization needs' do
      organization = create(:organization)
      visit admin_organization_path(organization)

      click_link 'Add item request'

      fill_in 'Item', with: 'Socks'
      fill_in 'Comment', with: 'Must be good quality'

      click_button 'Submit'

      assert_equal admin_organization_path(organization), current_path
      assert_button 'Socks'
    end

    test 'disable a need' do
      organization = create(:organization)
      socks = create(:need, item: 'Socks', organization: organization)
      visit admin_organization_path(organization)

      click_button 'Socks'

      assert_button 'Socks', class: 'btn-secondary'
      assert_not socks.reload.enabled?
    end
  end
end
