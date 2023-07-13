class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def index
    @orders = Order.all
    @order_details = OrderDetail.where(order_id: params[:id])
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end
  
  def confirm
     @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.address_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
       @address = DeliveryAddress.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.address_name = @address.name
    end
      @cart_items = current_customer.cart_items
      @order_new = Order.new
  end
  
  def create
    order = Order.new(order_params)
    order.save
    @cart_items = current_customer.cart_items.all
    
    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = order.id
      @order_details.item_id = cart_item.item.id
      @order_details.price_intax = cart_item.item.with_tax_price
      @order_details.amount = cart_item.amount
      @order_details.save
    end
   
    @cart_items.destroy_all
    redirect_to orders_thanks_path
  end

  def thanks

  end


  private
    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :address_name, :postage, :total, :customer_id )
    end

end
