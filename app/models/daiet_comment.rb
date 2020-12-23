class DaietComment < ApplicationRecord
  belongs_to :user
  belongs_to :daiet
end
