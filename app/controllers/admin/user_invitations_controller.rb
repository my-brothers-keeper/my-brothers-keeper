# frozen_string_literal: true

module Admin
  # Invite new admins by sending them an email
  class UserInvitationsController < BaseController
    def new
      @user_invitation = UserInvitation.new
    end

    def create
      @user_invitation = UserInvitation.new(invitation_params)

      if @user_invitation.valid?
        @user_invitation.send_invitation_email

        flash[:alert] = "Sent invitation email to #{@user_invitation.email}"

        redirect_to admin_organization_path(current_user.organization_id)
      else
        render :new
      end
    end

    private

    def invitation_params
      params
        .require(:user_invitation)
        .permit(:email)
        .merge(organization: current_user.organization)
    end
  end
end
