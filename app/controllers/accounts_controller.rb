class AccountsController < ApplicationController
  def show
    account = Account.where(user_id: current_user.id).first
    @orders = account.orders.where(status: "Placed")
  end
end
