class User < ApplicationRecord
  has_one_attached :photo
  has_many :clubs
  has_many :donations
  has_many :bookmarks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
