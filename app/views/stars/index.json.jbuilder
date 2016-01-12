json.array!(@stars) do |star|
  json.extract! star, :id, :user_id, :project_id
  json.url star_url(star, format: :json)
end
