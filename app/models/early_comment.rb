class EarlyComment < ApplicationRecord

  belongs_to :user
  belongs_to :early

  with_options presence: true do
    validates :content
    validates :user
    validates :early
  end
end
