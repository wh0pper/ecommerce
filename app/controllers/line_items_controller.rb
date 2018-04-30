class LineItemsController < ApplicationController

  def create
    @order = current_order
    @item = @order.line_items.new(item_params)
    @order.save
    session[:order_id] = @order.id
    redirect_to products_path
  end

  private

  def item_params
    params.require(:line_item).permit(:quantity, :product_id)
  end
end
