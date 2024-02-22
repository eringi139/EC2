class Public::OrdersController < ApplicationController
 
  def new
    @order = Order.new
  end

  def confirm
   @cart_items = CartItem.where(customer_id: current_customer.id)
   @shipping_fee = 800
   @selected_pay_method = params[:order][:pey_method]
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
