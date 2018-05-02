class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      if user_signed_in?
        existing_orders = current_user.account.orders.where(status: "In progress")
        if existing_orders.empty?
          order = Account.find(current_user.id).orders.create
          session[:order_id] = order.id
          return order
        else
          session[:order_id] = existing_orders.last.id
          return existing_orders.last
        end
      else
        order = Order.create
        session[:order_id] = order.id
        return order
      end
    end
  end



  def after_sign_in_path_for(user)
    account = Account.where(user_id: user.id).first
    session[:account_id] = account.id
    account.orders << current_order
    if session[:current_url].present?
      session[:current_url]
    else
      root_path
    end
  end
end
