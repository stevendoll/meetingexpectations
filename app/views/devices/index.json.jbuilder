json.array!(@devices) do |device|
  json.extract! device, :id, :device_type, :device_token, :user_id
  json.url device_url(device, format: :json)
end
