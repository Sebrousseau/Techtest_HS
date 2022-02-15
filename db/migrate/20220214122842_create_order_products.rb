class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.float :total_price_ht
      t.float :total_price_ttc
      t.integer :quantity
      t.timestamps
    end
  end
end
