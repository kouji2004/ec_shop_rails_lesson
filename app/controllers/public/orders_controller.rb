class Public::OrdersController < ApplicationController

  def log
  end

  def new
    @order = Order.new
  end
end
