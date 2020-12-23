class LearnComment < ApplicationRecord

  belongs_to :user
  belongs_to :learn

  with_options preesnce: true do
    validates :user
    validates :learn
  end
end
