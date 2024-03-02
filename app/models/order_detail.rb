class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  def subtotal
  order.with_tax_price * quantity
  end
end
