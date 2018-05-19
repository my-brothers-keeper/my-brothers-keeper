require "application_system_test_case"

module Admin
  class AddNeedsTest < ApplicationSystemTestCase
    test 'add comment to a need' do

      organization = create(:organization)

      need = create(:need, organization: organization)

      user = create(:user, username: 'username', password: 'password', organization: organization)
      visit login_path
      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password
      click_button 'Login'

      visit admin_organization_path(organization)

      click_link 'Add/edit comment'

      fill_in 'Comment', with: 'Must be good quality'

      click_button 'Submit'

      assert_equal admin_organization_path(organization), current_path
      assert_equal 'Must be good quality', need.reload.comment
    end

    test 'disable a need' do

      organization = create(:organization)      

      socks = create(:need, item: 'Socks', organization: organization)

      user = create(:user, username: 'username', password: 'password', organization: organization)
      visit login_path
      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password
      click_button 'Login' 

      visit admin_organization_path(organization)

      click_button 'Socks'

      assert_button 'Socks', class: 'btn-secondary'
      assert_not socks.reload.enabled?
    end
  end
end
