class ExerciseComment < ApplicationRecord

  belongs_to :user
  belongs_to :exercise

  with_options preesnce: true do
    validates :user
    validates :exercise
  end
end
