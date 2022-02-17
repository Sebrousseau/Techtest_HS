class Order < ApplicationRecord
  has_one :invoice
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  # validates :total_ht, presence: true
  validates :customer, presence: true
end
