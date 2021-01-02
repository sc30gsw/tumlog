class Exercise < ApplicationRecord

  belongs_to :user
  has_many :exercise_comments, dependent: :destroy
  has_one_attached :image

  validates :text, presence: true
  validates :user, presence: true

  def self.search(search)
    if search != ""
      Exercise.where('text LIKE(?)', "%#{search}%")
    else
      Exercise.all
    end
  end
end
