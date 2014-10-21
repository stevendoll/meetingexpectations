json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :name, :description, :trashed, :template, :draft, :archived, :completed, :privacy, :starts_at, :ends_at, :all_day, :creator_id, :account_id, :location_id, :location_comments, :color
  json.url meeting_url(meeting, format: :json)
end
