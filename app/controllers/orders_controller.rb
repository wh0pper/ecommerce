class OrdersController < ApplicationController

  def show
    @order_items = current_order.line_items
  end

  def update
    current_order.status = "Placed"
    flash[:notice] = "Order successfully placed."
    new_order = Order.new
    session[:order_id] = new_order.id
    redirect_to products_path
  end
end
