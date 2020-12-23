class Mind < ApplicationRecord

  belongs_to :user
  has_many :mind_comments, dependent: :destroy
  has_one_attached :image

  validates :text, presence: true, unless: :was_attached?
  validates :user, presence: true

  def was_attached?
    self.image.attached?
  end

  def self.search(search)
    if search != ""
      Mind.where('text LIKE(?)', "%#{search}%")
    else
      Mind.all
    end
  end
end
