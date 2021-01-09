class ExerciseAssignment < ApplicationRecord
  belongs_to :member

  delegate :kind, :url, :title, to: :exercise

  def exercise_id
    super&.to_sym
  end

  def exercise
    Exercise.find(exercise_id)
  end
end
