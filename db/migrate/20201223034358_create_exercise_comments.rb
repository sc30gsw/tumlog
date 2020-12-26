class CreateExerciseComments < ActiveRecord::Migration[6.0]
  def change
    create_table :exercise_comments do |t|
      t.string :content, null: false
      t.references :user, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.timestamps
    end
  end
end
