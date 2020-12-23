class EarlyComment < ApplicationRecord

  belongs_to :user
  belongs_to :early

  with_options preesnce: true do
    validates :user
    validates :early
  end
end
