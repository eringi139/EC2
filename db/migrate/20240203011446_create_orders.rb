class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :pay_method, null: false
      t.integer :shipping_fee, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.integer :total_price, null: false

      t.timestamps
    end
  end
end
