class CreateClubSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :club_species do |t|
      t.references :club, null: false, foreign_key: true
      t.references :species, null: false, foreign_key: true

      t.timestamps
    end
  end
end
