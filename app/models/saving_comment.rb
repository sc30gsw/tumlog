class SavingComment < ApplicationRecord

  belongs_to :user
  belongs_to :saving

  with_options preesnce: true do
    validates :user
    validates :saving
  end
end
