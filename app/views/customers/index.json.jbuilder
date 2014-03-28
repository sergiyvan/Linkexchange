json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :webadress, :acc_type, :access_key, :is_active, :google_pr, :yandex_tic
  json.url customer_url(customer, format: :json)
end
