class SavingComment < ApplicationRecord

  belongs_to :user
  belongs_to :saving

  with_options presence: true do
    validates :content
    validates :user
    validates :saving
  end
end
