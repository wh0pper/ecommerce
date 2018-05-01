class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      if current_user
        Account.find(current_user.id).orders.new
      else
        Order.new
      end   
    end
  end
end
