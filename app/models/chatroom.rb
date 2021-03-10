class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :club
  belongs_to :user
end
