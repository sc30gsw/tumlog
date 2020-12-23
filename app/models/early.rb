class Early < ApplicationRecord

  belongs_to :user
  has_many :early_comments, dependent: :destroy
  has_one_attached :image

  validates :text, presence: true, unless: :was_attached?
  validates :user, presence: true

  def was_attached?
    self.image.attached?
  end

  def self.search(search)
    if search != ""
      Early.where('text LIKE(?)', "%#{search}%")
    else
      Early.all
    end
  end
end
