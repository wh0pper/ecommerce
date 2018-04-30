class Product < ApplicationRecord
  has_many :orders, through: :invoices
end
