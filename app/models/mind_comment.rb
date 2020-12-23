class MindComment < ApplicationRecord

  belongs_to :user
  belongs_to :mind

  with_options presence: true do
    validates :content
    validates :user
    validates :mind
  end
end
