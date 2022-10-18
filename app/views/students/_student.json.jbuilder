json.extract! student, :id, :name, :email_id, :uin, :employment_status, :is_undergrad, :courses_completed, :resume, :transcript, :access_level, :application_status, :comments, :assigned_courses, :assigned_sections, :rating, :feedback, :created_at, :updated_at
json.url student_url(student, format: :json)
