class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.float :unit_price_ht
      t.float :total_price_ht
      t.float :total_price_ttc
      t.float :tva
      t.string :img

      t.timestamps
    end
  end
end
