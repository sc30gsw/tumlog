class CreateExerciseComments < ActiveRecord::Migration[6.0]
  def change
    create_table :exercise_comments do |t|

      t.timestamps
    end
  end
end
