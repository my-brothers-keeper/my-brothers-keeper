FactoryBot.define do
  factory :user do
    username 'testuser'
    email 'test@example.com'
    password 'password'
    organization
  end
end
