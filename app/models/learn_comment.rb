class LearnComment < ApplicationRecord

  belongs_to :user
  belongs_to :learn

  with_options presence: true do
    validates :content
    validates :user
    validates :learn
  end
end
