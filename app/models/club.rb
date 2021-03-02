class Club < ApplicationRecord
  has_many :club_species
  has_many :donations
  belongs_to :user
end
