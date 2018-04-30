class Order < ApplicationRecord
  has_many :products, through: :line_items
end
