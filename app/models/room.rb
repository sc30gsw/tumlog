class Room < ApplicationRecord
  has_many :users, through: :room_users

  extend AcitiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :category_id, presence: true
  validates :category_id, numericality: { other_than: 1 }
end
