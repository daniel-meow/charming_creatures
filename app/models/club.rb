class Club < ApplicationRecord
  has_many :club_species
  has_many :donations
  has_many :articles
  belongs_to :user
end
