class Donation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :club
  before_create :sync
  monetize :amount_cents

  def sync
    if user 
      self.email = user.email
      self.first_name = user.first_name
      self.last_name = user.last_name
      self.address = user.address
    end
  end
end

# change the donation view accessiblity 
# add colums to donations table
# add if else statment to the form 

