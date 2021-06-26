# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

resp = RestClient::Request.execute(
    method: :get,
    url: "https://api.openbrewerydb.org/breweries",
    headers: {
        'Content-Type': 'application/json'
    }
)

brewery_data = JSON.parse(resp.body)
breweries = brewery_data

breweries.each do |brewery|
    Brewery.create(
        name: brewery["name"],
        brewery_type: brewery["brewery_type"],
        street: brewery["street"],
        city: brewery["city"],
        state: brewery["state"],
        postal_code: brewery["postal_code"],
        country: brewery["country"],
        phone: brewery["phone"],
        website_url: brewery["website_url"],
        latitude: brewery["latitude"],
        longitude: brewery["longitude"]
    )
end