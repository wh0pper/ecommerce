class OrdersController < ApplicationController

  def show
    @order_items = current_order.line_items
  end

  def update
    # current_order.status = "Placed"
    # current_order.placed_on = Date.today
    # current_order.save
    current_order.update(status: "Placed", placed_on: Date.today)
    flash[:notice] = "Order successfully placed."
    new_order = Account.where(user_id: current_user.id).first.orders.create
    session[:order_id] = new_order.id
    binding.pry
    redirect_to products_path
  end
end
