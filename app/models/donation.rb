class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :club

  monetize :amount_cents
end
