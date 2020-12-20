class Habit < ApplicationRecord

  belongs_to :user
  belongs_to :exercise
  belongs_to :daiet
  belongs_to :learn
  belongs_to :saving
  belongs_to :mind

  with_options presence: true do
    validates :text
    validates :user
  end
end
