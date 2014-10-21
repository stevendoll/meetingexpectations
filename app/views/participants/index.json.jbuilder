json.array!(@participants) do |participant|
  json.extract! participant, :id, :meeting_id, :user_id, :attended, :description
  json.url participant_url(participant, format: :json)
end
