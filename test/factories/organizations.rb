FactoryBot.define do
  factory :organization do
    sequence(:name) do |n|
      "Test organization #{n}"
    end

    description 'This is a great charity!'
    address '123 Test Street, Philadelphia PA'
  end
end
