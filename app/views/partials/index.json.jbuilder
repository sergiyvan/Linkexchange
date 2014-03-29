json.array!(@partials) do |partial|
  json.extract! partial, :id, :f_customer_id, :s_customer_id, :t_customer_id, :partial_html
  json.url partial_url(partial, format: :json)
end
