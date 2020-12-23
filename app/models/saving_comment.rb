class SavingComment < ApplicationRecord
  belongs_to :user
  belongs_to :saving
end
