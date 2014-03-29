json.array!(@known_urls) do |known_url|
  json.extract! known_url, :id, :url, :customer_id, :partial_id
  json.url known_url_url(known_url, format: :json)
end
