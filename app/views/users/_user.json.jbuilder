json.extract! user, :id, :fname, :lname, :nickname, :gender, :birthdate, :hometown, :marital_status, :bio, :created_at, :updated_at
json.url user_url(user, format: :json)