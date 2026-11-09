require 'open-uri'
require 'json'

Coin.destroy_all
Category.destroy_all

puts "Fetching categories from CoinGecko..."
categories_url = 'https://api.coingecko.com/api/v3/coins/categories'
categories_data = JSON.parse(URI.open(categories_url).read)

categories_data.first(5).each do |cat_data|
  category = Category.create!(
    name: cat_data['name'],
    coingecko_category_id: cat_data['id']
  )

  puts "Fetching coins for category: #{category.name}..."
  coins_url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&category=#{category.coingecko_category_id}"

  begin
    coins_data = JSON.parse(URI.open(coins_url).read)
    coins_data.each do |coin|
      category.coins.create!(
        name: coin['name'],
        symbol: coin['symbol'].upcase,
        current_price: coin['current_price'] || 0.0,
        market_cap: coin['market_cap'] || 0
      )
    end
  rescue OpenURI::HTTPError => e
    puts "Skipping due to error: #{e.message}"
  end

  sleep(2)
end

puts "Seeding complete! Categories: #{Category.count}, Coins: #{Coin.count}"