json.array!(@locations) do |location|
  json.extract! location, :id, :name, :address_1, :address_2, :city, :state, :zip
  json.url location_url(location, format: :json)
end
