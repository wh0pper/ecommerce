class LineItemsController < ApplicationController

  def create
    @order = current_order
    existing_item = @order.line_items.where(product_id: item_params[:product_id]).first
    if existing_item
      existing_item.increment!(:quantity, item_params[:quantity].to_i)
    else
      @order.line_items.create(item_params)
    end
    if @order.save!
      flash[:notice] = "Item added to cart!"
    else
      flash[:alert] = "Error adding item..."
    end
    session[:order_id] = @order.id
    redirect_to products_path
  end

  def update
    @line_item = LineItem.find(params[:id])
    @line_item.update(quantity: params[:line_item][:quantity].to_i)
    respond_to do |format|
      format.html { redirect_to order_path(current_order) }
      format.js
    end
  end

  def destroy
    @order = current_order
    @item = @order.line_items.find(params[:id])
    @item.destroy
    @order.save
    redirect_to order_path
  end

  private

  def item_params
    if params[:line_item][:quantity] == ''
      params[:line_item][:quantity] = '1'
    end
    params.require(:line_item).permit(:quantity, :product_id)
  end
end
