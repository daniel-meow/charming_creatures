class AddCoordinatesToClubs < ActiveRecord::Migration[6.0]
  def change
    add_column :clubs, :latitude, :float
    add_column :clubs, :longitude, :float
  end
end
