# frozen_string_literal: true

require 'application_system_test_case'

module Admin
  class InviteUsersTest < ApplicationSystemTestCase
    test 'invite a new admin user' do
      org = create(:organization)
      user = create(:user, organization: org)

      visit login_path
      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password
      click_button 'Login'

      click_link 'Invite New Admin'

      fill_in 'Email', with: 'newadmin@example.com'

      assert_changes 'ActionMailer::Base.deliveries.count' do
        click_button 'Send Invitation'
      end

      assert_equal 1, User.where(email: 'newadmin@example.com').count

      assert_css '.alert', text: 'Sent invitation email to newadmin@example.com'
    end
  end
end
