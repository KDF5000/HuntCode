json.array!(@users) do |user|
  json.extract! user, :id, :x_id, :x_username, :x_passwd, :x_email, :x_projects_id
  json.url user_url(user, format: :json)
end
