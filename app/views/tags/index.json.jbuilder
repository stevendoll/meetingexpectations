json.array!(@tags) do |tag|
  json.extract! tag, :id, :name, :icon, :color
  json.url tag_url(tag, format: :json)
end
