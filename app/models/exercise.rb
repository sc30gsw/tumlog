class Exercise < ApplicationRecord

  belongs_to :user
  has_many :exercise_comments, dependent: :destroy
  has_one_attached :image

  validates :text, presence: true, unless: :was_attached?
  validates :user, presence: true

  def was_attached?
    self.image.attached?
  end

  def self.search(search)
    if search != ""
      Exercise.where('text LIKE(?)', "%#{search}%")
    else
      Exercise.all
    end
  end
end
