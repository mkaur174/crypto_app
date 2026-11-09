class Category < ApplicationRecord
  has_many :coins, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end