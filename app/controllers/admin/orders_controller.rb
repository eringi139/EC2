class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @order_details = OrderDetail.where(order_id: @order)
  end
end
