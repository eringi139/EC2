class Public::OrdersController < ApplicationController
 
  def new
    @order = Order.new
  end 

  def confirm
   @order = Order.new(order_params)
   @cart_items = CartItem.where(customer_id: current_customer.id)
  
   if params[:order][:address_method] == "0"
        @order.post_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name 
    elsif params[:order][:address_method] = "2"
        @order.post_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
    else
    end
    @cart_item = current_customer.cart_item.all
  end

  def thanx
  end

  def create
  end

  def index
  end

  def show
  end
  
  private
def order_params
  params.require(:order).permit(:pay_method, :postal_code, :address, :name)
end
end
