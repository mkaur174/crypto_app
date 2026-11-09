class Coin < ApplicationRecord
  belongs_to :category
  validates :name, :symbol, :current_price, presence: true
end