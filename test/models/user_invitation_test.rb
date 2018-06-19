# frozen_string_literal: true

require 'test_helper'

class UserInvitationTest < ActiveSupport::TestCase
  test 'reject invalid email' do
    invitation = UserInvitation.new(email: 'bade.mail@')

    invitation.valid?

    assert_equal ['is invalid'], invitation.errors.messages[:email]
  end

  test 'allow well-formed email' do
    invitation = UserInvitation.new(email: 'valid@example.com')

    invitation.valid?

    assert_equal [], invitation.errors.messages[:email]
  end

  test '#send_invitation_email creates user with blank password' do
    organization = create(:organization)

    invitation = UserInvitation.new(
      email: 'user@example.com',
      organization: organization
    )

    invitation.send_invitation_email

    new_user = User.where(email: 'user@example.com', encrypted_password: nil)
    assert new_user.exists?
  end
end
