class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items
  belongs_to :account, optional: true

  before_save :update_totals
  before_create :update_status

  private

  def update_status
    if self.status.nil?
      self.status = "In progress"
    end
  end

  def update_totals
    self.total_price = self.line_items.collect { |item| item.product.price * item.quantity }.sum
    self.total_quantity = self.line_items.collect { |item| item.quantity }.sum
  end
end
