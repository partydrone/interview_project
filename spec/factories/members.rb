FactoryBot.define do
  factory :member do
    sequence(:first_name) { |i| "member_first_name_{i}" }
    sequence(:last_name) { |i| "member_last_name_{i}" }
    date_of_birth { rand(3..9).years.ago - rand(0..365).days.ago }
  end
end
