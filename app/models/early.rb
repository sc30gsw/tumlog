class Early < ApplicationRecord

  belongs_to :user
  has_many :early_comments
  has_one_attached :image

  validates :text, presence: true, unless: :was_attached?
  validates :user, presence: true

  def was_attached?
    self.image.attached?
  end
end
