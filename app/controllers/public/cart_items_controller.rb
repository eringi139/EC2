class Public::CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.all
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    CartItem.destroy_all
  end

  def delete_all
    current_user.books.destroy_all
    redirect_back(fallback_location: root_path)
  end

  def create
    @cart_item_check = CartItem.find_by(customer_id: current_customer.id, item_id: params[:cart_items][:item_id])
    if @cart_item_check
      @cart_item_check.amount += params[:cart_items][:amount].to_i
      @cart_item_check.save
      
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      if @cart_item.save
        
        redirect_to cart_items_path
      else
        
        redirect_back(fallback_location: root_path)
      end
    end
  end
  
  private
 
def cart_item_params
  params.require(:cart_items).permit(:item_id, :amount)
end
end
