class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
       t.integer :customer_id
      t.integer :shipping_cost, default: 800
      t.integer :total_payment
      t.string  :name
      t.integer :payment_method
      t.string  :address
      t.string  :postal_code
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
