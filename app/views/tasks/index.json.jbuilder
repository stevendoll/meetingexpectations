json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :description, :planned_start, :planned_end, :trashed, :position
  json.url task_url(task, format: :json)
end
