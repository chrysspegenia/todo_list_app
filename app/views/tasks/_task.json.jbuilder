json.extract! task, :id, :name, :completed, :created_at, :updated_at, :task_description
json.url task_url(task, format: :json)
