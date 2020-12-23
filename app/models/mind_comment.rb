class MindComment < ApplicationRecord
  belongs_to :user
  belongs_to :mind
end
