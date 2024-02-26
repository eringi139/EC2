class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!


  def new
    @order = Order.new
  end

  def confirm
   @order = Order.new(order_params)
   @cart_items = CartItem.where(customer_id: current_customer.id)

   if params[:order][:address_method] == "0"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_method] = "2"
        @order.postal_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
    else
    end
    @cart_item = current_customer.cart_items.all
  end

  def thanx
  end

  def create
     @order = Order.new(order_params)
     @order.customer_id = current_customer.id
     @order.shipping_fee = 800

    if @order.save
      @cart_items = CartItem.where(customer_id: current_customer.id)
      @cart_items.each do |cart_item|
       order_detail = OrderDetail.new
       order_detail.item_id = cart_item.item_id
       order_detail.order_id = @order.id
       order_detail.quantity = cart_item.amount
       order_detail.price = (cart_item.item.price*1.1).floor
       order_detail.save
      end
    end
    @cart_items.destroy_all
    redirect_to orders_thanx_path
  end

  def index
    @orders = Order.where(customer_id: current_customer.id).order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

  private
def order_params
  params.require(:order).permit(:pay_method, :customer_id, :postal_code, :address, :name, :total_price)
end
end
