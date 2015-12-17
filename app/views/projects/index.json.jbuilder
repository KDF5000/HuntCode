json.array!(@projects) do |project|
  json.extract! project, :id, :name, :info, :url
  json.url project_url(project, format: :json)
end
