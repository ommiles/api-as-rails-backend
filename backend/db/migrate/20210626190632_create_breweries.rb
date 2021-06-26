class CreateBreweries < ActiveRecord::Migration[6.1]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :brewery_type
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :phone
      t.string :website_url
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
