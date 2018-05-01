class AddTotalQuantityToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :total_quantity, :integer
  end
end
