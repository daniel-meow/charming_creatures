class Club < ApplicationRecord
  has_one_attached :logo
  has_many_attached :photos
  has_many :club_species
  has_many :donations
  has_many :articles
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :address, :description, :category, presence: true
end
