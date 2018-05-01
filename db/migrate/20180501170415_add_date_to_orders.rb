class AddDateToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :placed_on, :date
  end
end
