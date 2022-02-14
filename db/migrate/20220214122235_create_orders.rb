class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.float :total_ht
      t.float :total_ttc
      t.string :status
      t.string :customer

      t.timestamps
    end
  end
end
