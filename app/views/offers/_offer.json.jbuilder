json.extract! offer, :id, :advertiser_name, :url, :description, :starts_at, :ends_at, :state, :premium, :manual_disable, :created_at, :updated_at
json.url offer_url(offer, format: :json)
