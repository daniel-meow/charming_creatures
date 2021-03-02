class CreateClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :clubs do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :category
      t.string :instagram_link
      t.string :facebook_link
      t.string :website_link
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
