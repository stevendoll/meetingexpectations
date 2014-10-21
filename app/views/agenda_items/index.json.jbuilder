json.array!(@agenda_items) do |agenda_item|
  json.extract! agenda_item, :id, :ends_at, :starts_at, :completed, :trashed, :description, :position, :presenter, :name, :meeting_id
  json.url agenda_item_url(agenda_item, format: :json)
end
