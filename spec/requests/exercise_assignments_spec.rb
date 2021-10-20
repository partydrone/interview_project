require 'rails_helper'

RSpec.describe "/exercise_assignments", type: :request do
  describe "GET /index" do
    let(:exercise_assignments) { FactoryBot.create_list(:exercise_assignment, 3) }

    it "renders a successful response" do
      get exercise_assignments_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let(:exercise_assignment) { FactoryBot.create(:exercise_assignment) }

    it "renders a successful response" do
      get exercise_assignment_path(exercise_assignment)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    let(:member) { FactoryBot.create(:member) }
    let(:exercise_id) { Exercise.ids.sample }

    context "with valid parameters" do
      let(:params) { {exercise_assignment: { member_id: member.id, exercise_id: exercise_id }} }

      it "creates a new ExerciseAssignment" do
        expect {
          post exercise_assignments_path, params: params
        }.to change(ExerciseAssignment, :count).by(1)
      end

      it "renders a JSON response with the new exercise_assignment" do
        post exercise_assignments_path, params: params
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      let(:params) { {exercise_assignment: { member_id: nil, exercise_id: nil }} }

      it "does not create a new ExerciseAssignment" do
        expect {
          post exercise_assignments_path, params: params
        }.to change(ExerciseAssignment, :count).by(0)
      end

      it "renders a JSON response with errors for the new exercise_assignment" do
        post exercise_assignments_path, params: params
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    let(:exercise_assignment) { FactoryBot.create(:exercise_assignment) }

    it "destroys the requested exercise_assignment" do
      expect {
        delete exercise_assignment_path(exercise_assignment)
      }.to change(ExerciseAssignment, :count).by(-1)
    end
  end
end
