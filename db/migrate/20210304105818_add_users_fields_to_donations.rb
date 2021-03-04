class AddUsersFieldsToDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :first_name, :string
    add_column :donations, :last_name, :string
    add_column :donations, :address, :string
    add_column :donations, :email, :string
  end
end
