class Mind < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :text
    validates :user
  end
end
