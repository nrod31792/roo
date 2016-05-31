json.array!(@accounts) do |account|
  json.extract! account, :id, :account_id, :company, :address, :city, :state, :postal_code, :country, :phone
  json.url account_url(account, format: :json)
end
