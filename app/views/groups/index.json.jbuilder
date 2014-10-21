json.array!(@groups) do |group|
  json.extract! group, :id, :name, :account_id, :creator_id, :parent_group_id
  json.url group_url(group, format: :json)
end
