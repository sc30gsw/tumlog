class Room < ApplicationRecord
  has_many :users, through: :room_users
  belongs_to :category
end
