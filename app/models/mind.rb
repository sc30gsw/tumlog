class Mind < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :text
    validates :user
  end
end
