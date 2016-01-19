json.array!(@subscribes) do |subscribe|
  json.extract! subscribe, :id, :sub_email, :status
  json.url subscribe_url(subscribe, format: :json)
end
