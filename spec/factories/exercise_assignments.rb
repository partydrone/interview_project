# == Schema Information
#
# Table name: exercise_assignments
#
#  id           :bigint           not null, primary key
#  completed_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  exercise_id  :string
#  member_id    :bigint
#
# Indexes
#
#  index_exercise_assignments_on_member_id  (member_id)
#
FactoryBot.define do
  factory :exercise_assignment do
    member
    exercise_id { Exercise.ids.sample }

    trait :completed do
      completed_at { Time.now }
    end
  end
end
