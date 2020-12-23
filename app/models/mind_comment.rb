class MindComment < ApplicationRecord

  belongs_to :user
  belongs_to :mind

  with_options preesnce: true do
    validates :user
    validates :mind
  end
end
