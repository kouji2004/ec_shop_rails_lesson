class Public::OrdersController < ApplicationController

  def log
  end

  def new
    @order = Order.new
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    @order.order_status = 0
    if @order.save
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.item_count = cart.item_count
        order_detail.ordered_price = cart.item.price
        order_detail.making_status = 0
        order_detail.save
      end
      redirect_to thanks_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

end
