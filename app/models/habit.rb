class Habit < ApplicationRecord

  belongs_to :user
  belongs_to :exercise
  belongs_to :daiet
  belongs_to :learn
  belongs_to :saving
  belongs_to :mind
end
