class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.references :order, null: false, foreign_key: true
      t.float :total_ht
      t.float :total_ttc
      t.date :payment_date
      t.string :customer

      t.timestamps
    end
  end
end
