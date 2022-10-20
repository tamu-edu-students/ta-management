json.extract! user, :name, :email_id, :password, :confirm_password, :access_level
json.url user_url(user, format: :json)
