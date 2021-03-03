class RemoveAmountFromDonations < ActiveRecord::Migration[6.0]
  def change
    remove_column :donations, :amount, :float
  end
end
