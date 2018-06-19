class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :validatable

  belongs_to :organization
end
