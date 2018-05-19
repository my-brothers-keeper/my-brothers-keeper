# frozen_string_literal: true

# Encode and decode invitation tokens
class InvitationToken
  ALGORITHM = 'HS256'

  def self.for_user(user)
    new.encode(user.email)
  end

  def self.user_for_token(token)
    payload = new.decode(token)
    User.find_by(email: payload['email'])
  end

  def encode(email)
    payload = { email: email }

    JWT.encode(payload, secret, ALGORITHM)
  end

  def decode(token)
    JWT.decode(token, secret).first
  rescue JWT::DecodeError
    {}
  end

  private

  # Use Rails' default secret key to sign tokens
  def secret
    Rails.application.credentials.secret_key_base
  end
end
