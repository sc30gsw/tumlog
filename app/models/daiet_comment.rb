class DaietComment < ApplicationRecord

  belongs_to :user
  belongs_to :daiet

  with_options presence: true do
    validates :content
    validates :user
    validates :daiet
  end
end
