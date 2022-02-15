class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.float :total_ht
      t.float :total_ttc
      t.string :status, default: "À faire"
      t.string :customer
      t.boolean :apply_tva, default: false

      t.timestamps
    end
  end
end
