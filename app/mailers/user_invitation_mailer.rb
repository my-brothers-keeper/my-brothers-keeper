# frozen_string_literal: true

class UserInvitationMailer < ApplicationMailer
  def invitation(email_address, token)
    @token = token
    mail(to: email_address, subject: 'Welcome!')
  end
end
