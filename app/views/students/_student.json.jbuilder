json.extract! student, :id, :student_id, :password_digest, :first_name, :middle_name, :last_name, :gender, :date_of_birth, :contact_number, :address, :created_at, :updated_at
json.url student_url(student, format: :json)
