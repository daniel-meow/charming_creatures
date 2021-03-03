class Club < ApplicationRecord
  has_many_attached :photos
  has_many :club_species
  has_many :donations

  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :description, presence: true
  validates :category, presence: true
end
