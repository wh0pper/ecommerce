class Product < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :orders, through: :line_items

  scope :books, -> {where category: 'books'}
  scope :other, -> {where category: 'other'}

  def self.search(search)
    if search && search != ""
      return where("name LIKE :search", search: "%#{search}%")
    end
    self.all
  end
end
