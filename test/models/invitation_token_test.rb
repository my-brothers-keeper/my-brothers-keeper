# frozen_string_literal: true

require 'test_helper'

class InvitationTokenTest < ActiveSupport::TestCase
  test 'user can be converted to token and back again' do
    user = create(:user)
    token = InvitationToken.for_user(user)

    assert_equal user, InvitationToken.user_for_token(token)
  end
end
