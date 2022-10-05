json.extract! user, :id, :name, :email_id, :password, :access_level, :created_at, :updated_at
json.url user_url(user, format: :json)
