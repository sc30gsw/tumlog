class DaietComment < ApplicationRecord

  belongs_to :user
  belongs_to :daiet

  with_options preesnce: true do
    validates :user
    validates :daiet
  end
end
