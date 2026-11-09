json.extract! coin, :id, :name, :symbol, :current_price, :market_cap, :category_id, :created_at, :updated_at
json.url coin_url(coin, format: :json)
