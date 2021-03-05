class Article < ApplicationRecord
  belongs_to :club
  has_one_attached :photo
end
