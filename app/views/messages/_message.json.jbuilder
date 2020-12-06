json.extract! message, :id, :recipient, :content, :student_id, :created_at, :updated_at
json.url message_url(message, format: :json)
