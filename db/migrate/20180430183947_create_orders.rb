class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :status
      t.decimal :total_price, precision: 5, scale: 2
    end

    create_table :line_items do |t|
      t.integer :quantity
      t.belongs_to :order, index: true
      t.belongs_to :product, index: true
    end
  end
end
