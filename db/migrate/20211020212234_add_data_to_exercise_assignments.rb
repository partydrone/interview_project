class AddDataToExerciseAssignments < ActiveRecord::Migration[6.1]
  def change
    add_column :exercise_assignments, :data, :jsonb, default: {}
  end
end
