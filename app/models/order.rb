class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details
  enum pay_method: { credit_card: 0, transfer: 1 }
  
  def with_tax_price
  (total_price * 1.1).floor
end
end
