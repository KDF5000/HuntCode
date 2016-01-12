json.array!(@thirdparties) do |thirdparty|
  json.extract! thirdparty, :id, :identifier, :user_id
  json.url thirdparty_url(thirdparty, format: :json)
end
