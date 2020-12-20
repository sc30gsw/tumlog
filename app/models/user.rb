class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :exercises
 has_many :daiets
 has_many :learns
 has_many :savings
 has_many :minds
 
  with_options presence: true do
    validates :nickname
    validates :profile
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: 'is invalid. Input half-width characters' }
  end
end
