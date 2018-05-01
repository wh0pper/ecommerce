class OrdersController < ApplicationController
  before_action :authenticate_user!, :except => :show

  def show
    if params[:format]
      @order = Order.find(params[:format])
    else
      @order = current_order
    end
  end

  def update
    current_order.update(status: "Placed", placed_on: Date.today)
    flash[:notice] = "Order successfully placed."
    new_order = Account.where(user_id: current_user.id).first.orders.create
    session[:order_id] = new_order.id
    redirect_to products_path
  end
end
