json.array!(@resources) do |resource|
  json.extract! resource, :id, :title, :abstract, :url
  json.url resource_url(resource, format: :json)
end
