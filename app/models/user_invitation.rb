# frozen_string_literal: true

# Handle inviting new admins by emailing them a token
class UserInvitation
  include ActiveModel::Model

  attr_accessor :email, :organization

  validates :email, format: /.+@.+\..+/i

  def send_invitation_email
    create_user

    UserInvitationMailer.invitation(email, token).deliver_later
  end

  private

  attr_accessor :user

  def create_user
    self.user = User.new(email: email, organization: organization)
    user.save!(validate: false)
  end

  def token
    InvitationToken.for_user(user)
  end
end
