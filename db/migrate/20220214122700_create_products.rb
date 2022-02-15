class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :unit_price_ht
      t.float :tva
      t.string :img

      t.timestamps
    end
  end
end
