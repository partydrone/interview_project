require "rails_helper"

RSpec.describe ExerciseAssignment, type: :model do
  describe "#exercise" do
    it "loads the correct exercise based on the assigned id" do
      member = FactoryBot.create(:member)
      exercise_id = Exercise.ids.sample

      assignment = FactoryBot.create(:exercise_assignment, member: member, exercise_id: exercise_id)

      expect(assignment.exercise).to eq(Exercise.find(exercise_id))
    end
  end
end
