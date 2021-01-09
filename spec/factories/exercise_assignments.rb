FactoryBot.define do
  factory :exercise_assignment do
    member
    exercise_id { Exercise.ids.sample }

    trait :completed do
      completed_at { Time.now }
    end
  end
end
