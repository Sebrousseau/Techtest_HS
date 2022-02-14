class Product < ApplicationRecord
  has_many :order_products
  validates :name, presence: true
  validates :unit_price_ht, presence: true
  validates :quatity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
