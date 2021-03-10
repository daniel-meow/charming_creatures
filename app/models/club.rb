class Club < ApplicationRecord
  has_one_attached :logo
  has_many_attached :photos
  has_many :club_species
  has_many :donations
  has_many :articles, dependent: :destroy
  has_many :chatrooms
  belongs_to :user
  has_many :bookmarks

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true, uniqueness: true
  validates :address, :description, :category, presence: true
end
