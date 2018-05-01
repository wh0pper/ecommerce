class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order, :current_account

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      if user_signed_in?
        Account.find(current_user.id).orders.create
      else
        Order.create
      end
    end
  end

  def after_sign_in_path_for(user)
    account = Account.where(user_id: user.id).first
    session[:account_id] = account.id
    account.orders << current_order
  end
end
