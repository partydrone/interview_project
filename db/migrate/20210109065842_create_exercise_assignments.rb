class CreateExerciseAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :exercise_assignments do |t|
      t.references :member
      t.string :exercise_id
      t.timestamp :completed_at

      t.timestamps
    end
  end
end
