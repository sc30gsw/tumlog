class ExerciseComment < ApplicationRecord

  belongs_to :user
  belongs_to :exercise

  with_options presence: true do
    validates :content
    validates :user
    validates :exercise
  end
end
